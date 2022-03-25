module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :email, String, null: false
    field :genre, String, null: false
    field :song_title, String, null: false
    field :selected, Boolean, null: true
    field :user_type, Integer, null: false
  end
end
