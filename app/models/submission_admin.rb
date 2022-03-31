class SubmissionAdmin < ApplicationRecord
  after_initialize :set_favorite, unless: :persisted?

  belongs_to :admin
  belongs_to :submission

  private

    def set_favorite
      self.favorite = false if self.favorite.nil?
    end
end
