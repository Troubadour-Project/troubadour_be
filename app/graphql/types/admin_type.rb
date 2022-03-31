include(Rails.application.routes.url_helpers)

module Types
  class AdminType < Types::BaseObject
    field :id, ID, null: false
    field :username, String, null: true
    field :email, String, null: false
    field :submissions, [Types::SubmissionType], null: false
  end
end
