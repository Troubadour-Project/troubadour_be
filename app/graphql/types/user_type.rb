include(Rails.application.routes.url_helpers)

module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :email, String, null: false
    field :genre, String, null: false
    field :song_title, String, null: false
    field :selected, Boolean, null: true
    field :user_type, Integer, null: false
    field :profile, String, null: false
    field :video, String, null: false
  end

  def profile
    rails_blob_path(object.profile, only_path: true)
  end

  def video
    rails_blob_path(object.video, only_path: true)
  end
end
