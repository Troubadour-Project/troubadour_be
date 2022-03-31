class Api::V1::SubmissionsController < ApplicationController
  def create
    submission = Submission.create!(submission_params)
    attach_submission_admin(submission)
    render json: SubmissionsSerializer.new(submission), status: 201
  end

  private

  def submission_params
    params.require(:submission).permit(:email, :profile, :video, :genre, :name, :song_title, :winner)
  end

  def attach_submission_admin(submission)
    Admin.all.each do |admin|
      SubmissionAdmin.create!(admin_id: admin.id, submission_id: submission.id)
    end
  end
end
