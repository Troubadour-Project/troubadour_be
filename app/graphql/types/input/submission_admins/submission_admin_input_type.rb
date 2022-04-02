module Types
  module Input
    class SubmissionAdminInputType < Types::BaseInputObject
      argument :id, ID, required: true
      argument :admin_id, Integer, required: true
      argument :submission_id, Integer, required: true
      argument :favorite, Boolean, required: true
      # argument :submission_admin, Types::SubmissionAdminType, required: true
    end
  end
end
