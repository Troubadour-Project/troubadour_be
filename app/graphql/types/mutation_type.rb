module Types
  class MutationType < Types::BaseObject
    field :update_winner, mutation: Mutations::UpdateWinner
  end
end
