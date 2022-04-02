require 'rails_helper'

RSpec.describe Types::QueryType, type: :request do
  let(:query) {
    <<~GQL
    {
      getSubmissions {
        id
        name
        email
        genre
        songTitle
        winner
        profileUrl
        videoUrl
        adminFavorite(adminId: 1)
      }
    }
    GQL
  }

  let(:invalid_field) {
    <<~GQL
    {
      getSubmissions {
        id
        username
        genre
      }
    }
    GQL
  }

  context 'get_submissions' do
    it 'returns a multiple submissions' do
      admin = create(:admin, id: 1)
      submissions = create_list(:submission, 3)
      create(:submission_admin, admin_id: admin.id, submission_id: submissions[0].id, favorite: true)
      create(:submission_admin, admin_id: admin.id, submission_id: submissions[1].id, favorite: false)
      create(:submission_admin, admin_id: admin.id, submission_id: submissions[2].id, favorite: false)
      response = TroubadourBeSchema.execute(query)
      parsed = json_parse(response.to_json)[:data][:getSubmissions]

      expect(parsed.count).to eq(3)
      expect(parsed.last[:id]).to eq(submissions[0].id.to_s)
      expect(parsed.last[:name]).to eq(submissions[0].name)
      expect(parsed.last[:email]).to eq(submissions[0].email)
      expect(parsed.last[:genre]).to eq(submissions[0].genre)
      expect(parsed.last[:songTitle]).to eq(submissions[0].song_title)
      expect(parsed.last[:winner]).to eq(submissions[0].winner)
      expect(parsed.last[:profileUrl]).to start_with('https://troubadour-capstone-dev.s3.us-west-1.amazonaws.com/')
      expect(parsed.last[:videoUrl]).to start_with('https://troubadour-capstone-dev.s3.us-west-1.amazonaws.com/')
      expect(parsed.last[:adminFavorite]).to eq(submissions[0].admin_favorite(1))
    end

    it 'returns a error when given a nonexistant field' do
      admin = create(:admin, id: 1)
      submission = create(:submission, id: 1)
      create(:submission_admin, admin_id: admin.id, submission_id: submission.id)
      response = TroubadourBeSchema.execute(invalid_field)
      parsed = json_parse(response.to_json)[:errors]

      expect(parsed.count).to eq(1)
      expect(parsed[0][:message]).to eq("Field 'username' doesn't exist on type 'Submission'")
      expect(parsed[0][:locations][0][:line]).to eq(4)
      expect(parsed[0][:locations][0][:column]).to eq(5)
      expect(parsed[0][:path][0]).to eq('query')
      expect(parsed[0][:path][1]).to eq('getSubmissions')
      expect(parsed[0][:path][2]).to eq('username')
      expect(parsed[0][:extensions][:code]).to eq('undefinedField')
      expect(parsed[0][:extensions][:typeName]).to eq('Submission')
      expect(parsed[0][:extensions][:fieldName]).to eq('username')
    end
  end
end
