module Types
  module Input
    class SubmissionAdminInputType < Types::BaseInputObject
      argument :admin_id, Integer, required: true
      argument :submission_id, Integer, required: true
      argument :favorite, Boolean, required: true
    end
  end
end
