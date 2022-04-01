require 'rails_helper'

RSpec.describe Mutations::FavoriteSubmissionAdmin, type: :request do
  let(:query) {
          <<~GQL
          mutation {
            favoriteSubmissionAdmin(input: { submission_id: "#{@submission.id}", admin_id: "#{@admin.id}"})
        }
      GQL
      }

  describe '.resolve' do
    it 'updates a SubmissionAdmins favorite status' do
      @admin = create(:admin, id: 1)
      @submission = create(:submission, id: 1)

      post '/graphql', params: { query: query }

      json = JSON.parse(response.body)
      data = json['data']

      expect(data['submission_admin']['favoriteSubmissionAdmin']).to eq(true)

      post '/graphql', params: { query: query }

      json = JSON.parse(response.body)
      data = json['data']

      expect(data['submission_admin']['favoriteSubmissionAdmin']).to eq(false)
    end
  end
end
