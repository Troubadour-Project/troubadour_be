class UsersController < ApplicationController
  def create
    user = User.create!(user_params)
    user.profile.attach(user_params[:profile])
    user.video.attach(user_params[:video])

    redirect_to(url_for(user.profile))
  end

  private

  def user_params
    params.permit(:email, :profile, :video, :genre, :name, :song_title)
  end
end
