class Admin < ApplicationRecord
  has_many :submission_admins
  has_many :submissions, through: :submission_admins
  
  validates_presence_of :username
  validates_presence_of :email
end
