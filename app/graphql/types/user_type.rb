include(Rails.application.routes.url_helpers)

module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: true
    field :email, String, null: false
    field :genre, String, null: false
    field :song_title, String, null: false
    field :selected, Boolean, null: true
    field :user_type, Integer, null: false
    field :profile, String, null: false
    field :video, String, null: false
  end

  def profile
    url_for(object.profile)
  end

  def video
    url_for(object.video)
  end
end
