include(Rails.application.routes.url_helpers)

module Types
  class SubmissionAdminType < Types::BaseObject
    field :id, ID, null: true
    field :submission_id, Integer, null: true
    field :admin_id, Integer, null: true
    field :favorite, Boolean, null: true
  end
end
