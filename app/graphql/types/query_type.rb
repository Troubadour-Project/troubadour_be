module Types
  class QueryType < Types::BaseObject
    # Submission Queries
    field :get_submission, resolver: Queries::GetSubmission, description: 'Returns a submissions data'
    field :get_submissions, resolver: Queries::GetSubmissions, null: true, description: 'Returns a list of submissions'
    field :get_winner, resolver: Queries::GetWinner, null: true, description: 'Returns a winning submission if there is one'

    # Admin Queries
    field :get_admin, resolver: Queries::GetAdmin, null: true, description: 'Returns a specific admins data'
  end
end
