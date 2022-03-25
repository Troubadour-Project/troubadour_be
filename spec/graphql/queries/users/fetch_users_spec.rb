require 'rails_helper'

RSpec.describe Types::QueryType do
  describe 'display users' do
    it 'can query all users' do
      create_list(:user, 5)

      response = TroubadourBeSchema.execute(query).as_json
      expect(response["data"]["fetchUsers"].count).to eq(5)

      users = User.all
      expect(response.dig("data", "fetchUsers")).to match_array(
      users.map { |user| {"name" => user.name, "email" => user.email, "selected" => user.selected,
        "songTitle" => user.song_title, "genre" => user.genre, "userType" => user.user_type}})
      end
    end

    def query
      <<~GQL
      {
        fetchUsers {
          name
          email
          songTitle
          genre
          userType
          selected
        }
      }
      GQL
    end
end
