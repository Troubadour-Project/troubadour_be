module Mutations
  module Users
    class CreateUser < Mutations::BaseMutation
      argument :id, ID, required: true
      argument :name, String, required: true
      argument :email, String, required: true
      argument :genre, String, required: true
      argument :song_title, String, required: true
      argument :user_type, Integer, required: true
      argument :profile, ApolloUploadServer::Upload, required: true
      argument :video, ApolloUploadServer::Upload, required: true

      type Types::UserType

      def resolve(input)
        profile = input[:profile]
        profile_blob = ActiveStorage::Blob.create_and_upload!(
          io: profile,
          filename: profile.original_filename,
          content_type: profile.content_type
        )

        video = input[:video]
        video_blob = ActiveStorage::Blob.create_and_upload!(
          io: video,
          filename: video.original_filename,
          content_type: video.content_type
        )

        user = User.new(
          name: input[:name],
          email: input[:email],
          genre: input[:genre],
          song_title: input[:song_title],
          user_type: input[:user_type],
          profile: input[:profile_blob],
          video: input[:video_blob]
        )

        if user.save
          { user: user }
        else
          { errors: event.errors.full_messages }
        end
      end
    end
  end
end
