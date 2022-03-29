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
    field :profile_url, String, null: false
    field :video_url, String, null: false
    
    def profile_url
      object.profile.url
    end
  
    def video_url
      object.video.url
    end
  end
end
