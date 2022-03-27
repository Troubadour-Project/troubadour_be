class User < ApplicationRecord
  validates_presence_of :email
  has_one_attached :profile
  has_one_attached :video

end
