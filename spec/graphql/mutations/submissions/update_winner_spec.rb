require 'rails_helper'

RSpec.describe Mutations::UpdateWinner, type: :request do
  describe 'resolve' do
    it 'updates a winner' do
      create_list(:submission, 5)
      first_submission = Submission.all.first
      last_submission = Submission.all.last
      post '/graphql', params: { query: query(id: first_submission.id, winner: true) }
      json = JSON.parse(response.body, symbolize_names: true)
      result = json[:data]
      
      expect(result[:updateWinner][:submission]).to have_key(:id)
      expect(result[:updateWinner][:submission]).to have_key(:name)
      expect(result[:updateWinner][:submission]).to have_key(:genre)
      expect(result[:updateWinner][:submission]).to have_key(:songTitle)
      expect(result[:updateWinner][:submission]).to have_key(:winner)

      expect(result[:updateWinner][:submission][:winner]).to eq(true)

      revised_first_submission = Submission.all.first
      expect(revised_first_submission.winner).to eq(true)

      post '/graphql', params: { query: query(id: last_submission.id, winner: true) }
      revised_last_submission = Submission.all.last

      expect(revised_last_submission.winner).to eq(true)
      expect(Submission.all.first.winner).to eq(false)
    end
  end

  def query(id:, winner:)
    <<~GQL
      mutation {
        updateWinner(input: {
          id: #{id}
          winner: #{winner}
        }) {
          submission {
            id
            name
            genre
            songTitle
            winner
          }
        }
      }
    GQL
  end
end
