class Submission < ApplicationRecord
  has_one_attached :profile
  has_one_attached :video
  has_many :submission_admins
  has_many :admins, through: :submission_admins
  
  validates_presence_of :name
  validates_presence_of :email
  validates_presence_of :genre
  validates_presence_of :song_title
  validates_presence_of :winner
end
