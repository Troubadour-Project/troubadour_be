include(Rails.application.routes.url_helpers)

module Types
  class SubmissionAdminType < Types::BaseObject
    field :id, ID, null: false
    field :submission_id, Integer, null: false
    field :admin_id, Integer, null: false
    field :favorite, Boolean, null: true
  end
end
