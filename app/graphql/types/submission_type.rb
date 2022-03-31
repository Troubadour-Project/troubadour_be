include(Rails.application.routes.url_helpers)

module Types
  class SubmissionType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: true
    field :email, String, null: false
    field :genre, String, null: false
    field :song_title, String, null: false
    field :winner, Boolean, null: true
    field :profile, String, null: false
    field :video, String, null: false
    field :profile_url, String, null: false
    field :video_url, String, null: false

    field :admin_favorite, Boolean, null: false do
      argument :admin_id, Integer, required: true
      # argument :submission_id, Integer, required: true
    end
    
    def profile_url
      object.profile.url
    end
  
    def video_url
      object.video.url
    end

    def admin_favorite(admin_id:)
      if object.submission_admins.where(admin_id: admin_id).where(favorite: true)
        return true
      else
        return false
      end
    end
  end
end
