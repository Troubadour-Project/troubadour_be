module Mutations
    class FavoriteSubmissionAdmin < ::Mutations::BaseMutation
      argument :admin_id, Integer, required: true
      argument :submission_id, Integer, required: true

      type Types::SubmissionAdminType

      def resolve(attributes)
        submission_admin = SubmissionAdmin.where(submission_id: attributes[:submission_id])
        .where(admin_id: attributes[:admin_id]).first

        !submission_admin.favorite ? submission_admin.update(favorite: true) : submission_admin.update(favorite: false)
        { submission_admin: submission_admin }
      end
    end
  end
