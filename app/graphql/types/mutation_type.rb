module Types
  class MutationType < Types::BaseObject
    field :favorite_submission_admin, mutation: Mutations::FavoriteSubmissionAdmin
  end
end
