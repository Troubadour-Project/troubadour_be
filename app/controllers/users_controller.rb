class UsersController < ApplicationController
  def create
    email = { email: user_params[:email] }
    user = User.create!(email)
    user.profile.attach(user_params[:profile])
    user.video.attach(user_params[:video])
    
    redirect_to(url_for(user.profile))
  end

  private

  def user_params
    params.permit(:email, :profile, :video)
  end
end
