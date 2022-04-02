class Submission < ApplicationRecord
  after_initialize :set_winner, unless: :persisted?
  after_create :create_submission_admins

  has_one_attached :profile
  has_one_attached :video
  has_many :submission_admins
  has_many :admins, through: :submission_admins

  validates_presence_of :name
  validates_presence_of :email
  validates_presence_of :genre
  validates_presence_of :song_title
  validates :winner, exclusion: [nil]

  # Instance methods
  def admin_favorite(admin_id)
    sub_admin = submission_admins.where(admin_id: admin_id)
    if sub_admin.empty?
      return false
    else
      return sub_admin.first.favorite
    end
  end

  private

  def set_winner
    self.winner = false if self.winner.nil?
  end

  def create_submission_admins
    Admin.all.each do |admin|
      submission_admins.create!(admin_id: admin.id)
    end
  end
end
