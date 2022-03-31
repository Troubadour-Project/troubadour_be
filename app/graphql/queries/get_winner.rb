module Queries
  class GetWinner < Queries::BaseQuery
    type Types::SubmissionType, null: false

    def resolve
      Submission.where(winner: true).first
    end
  end
end
