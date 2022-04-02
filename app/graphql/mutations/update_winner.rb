class Mutations::UpdateWinner < Mutations::BaseMutation
  argument :id, ID, required: true
  argument :winner, Boolean, required: true

  field :submission, Types::SubmissionType, null: false

  def resolve(id:, winner:)
    submission = Submission.find(id)
    submission.update(winner: winner)
    { submission: submission }
  end
end
