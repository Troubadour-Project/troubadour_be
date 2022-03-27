module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :fetch_users, resolver: Queries::FetchUsers, null: true, description: 'Returns a list of users'
    field :fetch_user, resolver: Queries::FetchUser

     def all
       User.all.with_attached_profile.with_attached_video
     end
  end
end
