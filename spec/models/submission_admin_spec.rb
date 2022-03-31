require 'rails_helper'

RSpec.describe SubmissionAdmin, type: :model do
  describe 'relationships' do
    it { should belong_to(:admin) }
    it { should belong_to(:submission) }
  end

  describe 'factory model' do
    it 'exists with attributes' do
      admin = build(:admin)
      submission = build(:submission)
      submission_admin = build(:submission_admin, admin: admin, submission: submission, favorite: true)

      expect(submission_admin).to be_a(SubmissionAdmin)
      expect(submission_admin).to have_attributes(admin: admin)
      expect(submission_admin).to have_attributes(submission: submission)
    end
  end
end
