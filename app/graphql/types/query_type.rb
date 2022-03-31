module Types
  class QueryType < Types::BaseObject
    field :get_submission, resolver: Queries::GetSubmission, description: 'Returns a submissions data'
    field :get_submissions, resolver: Queries::GetSubmissions, null: true, description: 'Returns a list of submissions'
    # field :get_winning_submissions, resolver: Queries::GetWinningSubmissions, null: true, description: 'Returns a list of winning submissions'

    field :get_admin, resolver: Queries::GetAdmin, null: true, description: 'Returns a specific admins data'

    #  def get_submissions
    #    Submission.all
    #  end
  end
end
