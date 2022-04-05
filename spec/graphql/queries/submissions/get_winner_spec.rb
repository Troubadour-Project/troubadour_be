require 'rails_helper'

RSpec.describe Types::QueryType, type: :request do
  let(:query) do
    <<~GQL
      {
          getWinner {
              id
              name
              email
              genre
              songTitle
              winner
              profileUrl
              videoUrl
          }
      }
    GQL
  end

  context 'get_winner' do
    it 'returns no winner' do
      admin = create(:admin, id: 1)
      create_list(:submission, 5)
      response = TroubadourBeSchema.execute(query)
      parsed = json_parse(response.to_json)

      expect(parsed[:data][:getWinner]).to eq(nil)
    end

    it 'returns a winner' do
      admin = create(:admin, id: 1)
      create_list(:submission, 5)
      first_submission = Submission.all.first

      response = TroubadourBeSchema.execute(query)
      parsed = json_parse(response.to_json)

      expect(parsed[:data][:getWinner]).to eq(nil)
      first_submission.update(winner: true)

      new_response = TroubadourBeSchema.execute(query)
      new_parsed = json_parse(new_response.to_json)

      expect(new_parsed[:data][:getWinner][:winner]).to eq(true)
      expect(new_parsed[:data][:getWinner][:id].to_i).to eq(first_submission.id)
    end

    it 'returns a different winner' do
      admin = create(:admin, id: 1)
      create_list(:submission, 5)
      first_submission = Submission.all.first
      last_submission = Submission.all.last

      response = TroubadourBeSchema.execute(query)
      parsed = json_parse(response.to_json)

      expect(parsed[:data][:getWinner]).to eq(nil)

      post '/graphql', params: { query: mutation(id: first_submission.id, winner: true) }

      expect(Submission.all.first.winner).to eq(true)

      new_response = TroubadourBeSchema.execute(query)
      new_parsed = json_parse(new_response.to_json)

      expect(new_parsed[:data][:getWinner][:winner]).to eq(true)
      expect(new_parsed[:data][:getWinner][:id].to_i).to eq(first_submission.id)

      post '/graphql', params: { query: mutation(id: last_submission.id, winner: true) }

      expect(Submission.all.first.winner).to_not eq(true)
      expect(Submission.all.last.winner).to eq(true)
      

    end
  end

  def mutation(id:, winner:)
    <<~GQL
            mutation {
        updateWinner(input: {id: #{id} winner: #{winner}}) {
          submission {
            id
            name
            email
            genre
            songTitle
            winner
          }
        }
      }
    GQL
  end
end
