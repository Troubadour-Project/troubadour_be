require 'rails_helper'

RSpec.describe Submission, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:song_title) }
    it { should validate_presence_of(:genre) }
    # it { should validate_presence_of(:winner) }
    it { should have_one_attached(:profile) }
    it { should have_one_attached(:video) }
  end

  describe 'factory model' do
    it 'exists with attributes' do
      submission = build(:submission, name: 'band', email: 'example@email.com', genre: 'parody', song_title: "don't start a band", winner: true)

      expect(submission).to be_a(Submission)
      expect(submission).to have_attributes(name: 'band')
      expect(submission).to have_attributes(email: 'example@email.com')
      expect(submission).to have_attributes(genre: 'parody')
      expect(submission).to have_attributes(song_title: "don't start a band")
      expect(submission).to have_attributes(winner: true)
      expect(submission.profile).to be_a(ActiveStorage::Attached)
      expect(submission.video).to be_a(ActiveStorage::Attached)
    end
  end

  describe 'instance methods' do
    describe 'admin_favorite' do
      it 'returns true when the submission is favorited by specific admin' do
        admin = create(:admin)
        submission = create(:submission)
        submission_admin = create(:submission_admin, admin: admin, submission: submission, favorite: true)
        
        expect(submission.admin_favorite(admin.id)).to eq(true)
      end

      it 'returns false when the submission is not favorited by specific admin' do
        admin = create(:admin)
        admin_favorite = create(:admin)

        submission = create(:submission)

        submission_admin = create(:submission_admin, admin: admin, submission: submission, favorite: false)
        submission_admin = create(:submission_admin, admin: admin_favorite, submission: submission, favorite: true)
  
        expect(submission.admin_favorite(admin.id)).to eq(false)
        expect(submission.admin_favorite(admin_favorite.id)).to eq(true)
      end
    end
  end
end
