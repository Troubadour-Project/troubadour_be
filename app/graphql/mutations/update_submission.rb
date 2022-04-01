class Mutations::UpdateSubmission < Mutations::BaseMutation
  argument :id, ID, required: true
  argument :winner, Boolean, required: true
  # argument :success, Boolean, required: false

  field :submission, Types::SubmissionType, null: false
  field :success, Boolean, null: false

  def resolve(id:, winner:)
    submission = Submission.find(id)
    submission.update(winner: winner)
    { success: true }
  end
end
