class Submission < ApplicationRecord
  validates_presence_of :email
  validates_presence_of :name
  validates_presence_of :genre
  validates_presence_of :song_title
  validates_presence_of :winner, :allow_nil => true
  has_one_attached :profile
  has_one_attached :video
end
