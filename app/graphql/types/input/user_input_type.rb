module Types
  module Input
    class UserInputType < Types::BaseInputObject
      argument :name, String, required: true
      argument :email, String, required: true
      argument :song_title, String, required: true
      argument :genre, String, required: true
      argument :user_type, Integer, required: true
      argument :selected, Boolean, required: false
    end
  end
end
