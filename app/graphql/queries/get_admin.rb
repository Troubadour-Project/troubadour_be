module Queries
  class GetAdmin < Queries::BaseQuery
    type Types::AdminType, null: false
    argument :id, ID, required: true

    def resolve(id:)
      Admin.find(id)
    rescue ActiveRecord::RecordNotFound => _e
      GraphQL::ExecutionError.new('Admin does not exist')
    rescue ActiveRecord::RecordInvalid => e
      GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
        " #{e.record.errors.full_messages.join(',')}")
    end
  end
end 
