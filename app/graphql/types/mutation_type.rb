module Types
  class MutationType < Types::BaseObject
    field :update_submission, mutation: Mutations::UpdateSubmission
  end
end
