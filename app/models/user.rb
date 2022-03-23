class User < ApplicationRecord
  has_one_attached :profile
  has_one_attached :video
end
