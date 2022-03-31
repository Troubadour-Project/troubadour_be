module Queries
  class GetSubmission < Queries::BaseQuery
    type Types::SubmissionType, null: false
    argument :id, ID, required: true

    def resolve(id:)
      Submission.find(id)
    rescue ActiveRecord::RecordNotFound => _e
      GraphQL::ExecutionError.new('Submission does not exist')
    rescue ActiveRecord::RecordInvalid => e
      GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
        " #{e.record.errors.full_messages.join(',')}")
    end
  end
end 
