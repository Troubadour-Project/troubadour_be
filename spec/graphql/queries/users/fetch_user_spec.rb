require 'rails_helper'

RSpec.describe Types::QueryType do
  # describe 'display one user' do
  #   it 'can query one user by id' do
  #     create(:user, id: 1)
  #     create(:user, id: 2)
  #     create(:user, id: 3)

  #     user = User.all[1]
  #     response = TroubadourBeSchema.execute(query).as_json
  
  #     expect(response["data"]["fetchUser"].count).to eq(6)
  #     expect(response["data"]["fetchUser"]["name"]).to eq(user.name)
  #     expect(response["data"]["fetchUser"]["email"]).to eq(user.email)
  #     expect(response["data"]["fetchUser"]["selected"]).to eq(nil)
  #     expect(response["data"]["fetchUser"]["songTitle"]).to eq(user.song_title)
  #     expect(response["data"]["fetchUser"]["genre"]).to eq(user.genre)
  #     expect(response["data"]["fetchUser"]["userType"]).to eq(user.user_type)
  #   end
  # end

  # def query
  #   <<~GQL
  #   {
  #     fetchUser(id: "2") {
  #       name
  #       email
  #       songTitle
  #       genre
  #       userType
  #       selected
  #     }
  #   }
  #   GQL
  # end
end
