# require 'rails_helper'

# RSpec.describe Types::QueryType, type: :request do
#   let(:query) {
#     <<~GQL
#     {
#       getAdmin(id: "1") {
#         id
#         name
#         email
#       }
#     }
#     GQL
#   }

#   describe 'display one user' do
#     it 'can query one user by id' do
#       create(:admin, id: 1)
#       create(:admin, id: 2)
#       create(:admin, id: 3)

#       user = User.all[1]
#       parsed = json_parse(TroubadourBeSchema.execute(query))
  
#       expect(parsed[:data][:fetchUser].count).to eq(6)
#       expect(parsed[:data][:fetchUser][:name]).to eq(user.name)
#       expect(parsed[:data][:fetchUser][:email]).to eq(user.email)
#       expect(parsed[:data][:fetchUser][:selected]).to eq(nil)
#       expect(parsed[:data][:fetchUser][:songTitle]).to eq(user.song_title)
#       expect(parsed[:data][:fetchUser][:genre]).to eq(user.genre)
#       expect(parsed[:data][:fetchUser][:userType]).to eq(user.user_type)
#     end
#   end
# end
