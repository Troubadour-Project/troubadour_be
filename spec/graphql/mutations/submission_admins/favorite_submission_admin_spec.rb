require 'rails_helper'

module Mutations
    RSpec.describe FavoriteSubmissionAdmin, type: :request do
      describe 'resolve' do
        it 'updates a submission admin favorite, if false to true and if true to false' do
          submission_admin = create(:submission_admin)
          expect(submission_admin.favorite).to eq(false)

          post '/graphql', params: { query: query(submission_id: submission_admin.submission_id, admin_id: submission_admin.admin_id) }

          expect(submission_admin.reload).to have_attributes(
            'submission_id' => submission_admin.submission_id,
            'admin_id'      => submission_admin.admin_id,
            'favorite'      => true
          )

          post '/graphql', params: { query: query(submission_id: submission_admin.submission_id, admin_id: submission_admin.admin_id) }

          expect(submission_admin.reload).to have_attributes(
            'submission_id' => submission_admin.submission_id,
            'admin_id'      => submission_admin.admin_id,
            'favorite'      => false
          )
        end

        it 'returns a submission_admin' do
          submission_admin = create(:submission_admin)

          post '/graphql', params: { query: query(submission_id: submission_admin.submission_id, admin_id: submission_admin.admin_id) }

          json = JSON.parse(response.body)
          data = json['data']['favoriteSubmissionAdmin']

          expect(data).to include(
            'submissionId'   => submission_admin.submission_id.to_s,
            'adminId'        => submission_admin.admin_id.to_s,
            'favorite'        => true

          )
        end
      end

      def query(submission_id:, admin_id:)
        <<~GQL
          mutation {
            favoriteSubmissionAdmin(input: {
              submissionId: #{submission_id}
              adminId: #{admin_id} }
            ) { submissionAdmin {
                id
                submissionId
                adminId
                favorite
              }
            }
          }
        GQL
      end
    end
  end
