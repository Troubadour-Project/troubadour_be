include(Rails.application.routes.url_helpers)

module Types
  class SubmissionType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: true
    field :email, String, null: false
    field :genre, String, null: false
    field :song_title, String, null: false
    field :winner, Boolean, null: true
    field :profile_url, String, null: false
    field :video_url, String, null: false

    field :admin_favorite, Boolean, null: true do
      argument :admin_id, Integer, required: true
    end
    
    def profile_url
      object.profile.url
    end
  
    def video_url
      object.video.url
    end

    def admin_favorite(admin_id:)
      object.admin_favorite(admin_id)
    end
  end
end
