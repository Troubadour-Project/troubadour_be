module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :fetch_users, resolver: Queries::FetchUsers, null: false, description: 'Returns a list of users'
    field :fetch_user, resolver: Queries::FetchUser
  end
end
