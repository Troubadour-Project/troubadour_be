module Queries
  class GetSubmissions < Queries::BaseQuery

    type [Types::SubmissionType], null: false

    def resolve
      Submission.all.order(created_at: :desc)
    end
  end
end
