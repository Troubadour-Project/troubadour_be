require 'rails_helper'

RSpec.describe Types::QueryType, type: :request do
  let(:query) {
    <<~GQL
    {
      getSubmission(id: 1) {
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

  let(:invalid_query) {
    <<~GQL
    {
      getSubmission(id: 2) {
        id
        name
        email
        genre
      }
    }
    GQL
  }

  let(:invalid_field) {
    <<~GQL
    {
      getSubmission(id: 1) {
        id
        username
        genre
      }
    }
    GQL
  }

  context 'get_submission' do
    it 'returns a single submission when given a valid id' do
      admin = create(:admin, id: 1)
      submission = create(:submission, id: 1)
      create(:submission_admin, admin_id: admin.id, submission_id: submission.id, favorite: true)
      response = TroubadourBeSchema.execute(query)
      parsed = json_parse(response.to_json)[:data][:getSubmission]

      expect(parsed.count).to eq(9)
      expect(parsed[:id]).to eq(submission.id.to_s)
      expect(parsed[:name]).to eq(submission.name)
      expect(parsed[:email]).to eq(submission.email)
      expect(parsed[:genre]).to eq(submission.genre)
      expect(parsed[:songTitle]).to eq(submission.song_title)
      expect(parsed[:winner]).to eq(submission.winner)
      expect(parsed[:profileUrl]).to start_with('https://troubadour-capstone-dev.s3.us-west-1.amazonaws.com/')
      expect(parsed[:videoUrl]).to start_with('https://troubadour-capstone-dev.s3.us-west-1.amazonaws.com/')
      expect(parsed[:adminFavorite]).to eq(submission.admin_favorite(1))
    end
    
    it 'returns a error when given no existant submission id' do
      admin = create(:admin, id: 1)
      submission = create(:submission, id: 1)
      create(:submission_admin, admin_id: admin.id, submission_id: submission.id)
      response = TroubadourBeSchema.execute(invalid_query)
      parsed = json_parse(response.to_json)

      expect(parsed[:data]).to eq(nil)
      expect(parsed[:errors].count).to eq(1)
      expect(parsed[:errors][0][:message]).to eq('Submission does not exist')
      expect(parsed[:errors][0][:locations][0][:line]).to eq(2)
      expect(parsed[:errors][0][:locations][0][:column]).to eq(3)
      expect(parsed[:errors][0][:path][0]).to eq('getSubmission')
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
      expect(parsed[0][:path][1]).to eq('getSubmission')
      expect(parsed[0][:path][2]).to eq('username')
      expect(parsed[0][:extensions][:code]).to eq('undefinedField')
      expect(parsed[0][:extensions][:typeName]).to eq('Submission')
      expect(parsed[0][:extensions][:fieldName]).to eq('username')
    end
  end
end
