class Api::V1::SubmissionsController < ApplicationController
  def create
    submission = Submission.create!(submission_params)

    json_response(SubmissionsSerializer.new(submission), :created)
  end

  private

  def submission_params
    params.require(:submission).permit(:email, :profile, :video, :genre, :name, :song_title, :winner)
  end
end
