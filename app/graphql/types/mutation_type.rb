module Types
  class MutationType < Types::BaseObject
    field :favorite_submission_admin, mutation: Mutations::FavoriteSubmissionAdmin
    field :update_winner, mutation: Mutations::UpdateWinner
  end
end
