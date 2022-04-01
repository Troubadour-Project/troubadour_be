module Mutations
    class FavoriteSubmissionAdmin < ::Mutations::BaseMutation
      argument :admin_id, Integer, required: true
      argument :submission_id, Integer, required: true

      field :submission_admin, Types::SubmissionAdminType, null: false

      def resolve(attributes)
        submission_admin = object.where(submission_id: attributes[:submission_id])
        .where(admin_id: attributes[:admin_id])
        !submission_admin.favorite ? submission_admin.update(favorite: true) : submission_admin.update(favorite: false)
        submission_admin
      end
    end
  end
end
