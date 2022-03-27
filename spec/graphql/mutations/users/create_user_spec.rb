# require 'rails_helper'
#
# module Mutations
#   module Users
#     RSpec.describe CreateUser, type: :request do
#       describe '.resolve' do
#         it 'creates a user' do
#           expect(User.count).to eq(0)
#           post '/graphql', params: {query: query}
#           expect(User.count).to eq(1)
#         end
#
#         it 'returns a user' do
#           post '/graphql', params: { query: query }
#           json = JSON.parse(response.body)
#           require "pry"; binding.pry
#           data = json['data']
#           expect(data['user']['name']).to eq('')
#           expect(data['user']['genre']).to eq('')
#           expect(data['user']['songTitle']).to eq('')
#           expect(data['user']['email']).to eq('')
#           expect(data['user']['video']).to eq('')
#           expect(data['user']['profile']).to eq('')
#         end
#
#         def query
#         <<~GQL
#         mutation {
#           user: createUser(
#           input: {
#             name: "Samantha"
#             email: "test@gmail.com"
#             profile: 'string'
#             video: 'string'
#             songTitle: 'Song'
#           }
#           ) {
#             name
#             id
#             songTitle
#             genre
#             email
#             profile
#             video
#             }
#           }
#         GQL
#         end
#       end
#     end
#   end
# end
