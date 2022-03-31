class SubmissionsSerializer
  include JSONAPI::Serializer

  attributes :name, :email, :song_title, :genre, :video, :profile, :winner

end
