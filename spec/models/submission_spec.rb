require 'rails_helper'

RSpec.describe Submission, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:song_title) }
    it { should validate_presence_of(:genre) }
    it { should validate_exclusion_of(:winner).in_array([nil]) }
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

  context 'private methods' do
    describe '#set_winner' do
      it 'sets the winner status after initalize when not given winner' do
        submission = Submission.new(email: 'example@email.com', name: 'sub', song_title: 'title', genre: 'genre')
        submission.profile.attach(
          io: File.open(Rails.root.join('spec/fixtures/blank_profile_photo.jpeg')), 
          filename: 'blank_profile_photo.jpeg', 
          content_type: 'image/jpeg'
        )
        submission.video.attach(
          io: File.open(Rails.root.join('spec/fixtures/pexels_stock_video.mp4')), 
          filename: 'pexels_stock_video.mp4', 
          content_type: 'video/mp4'
        )
        submission.save!
        
        expect(submission.winner).to eq(false)
      end
    end
    
    describe '#create_submission_admins' do
      it 'creates new submission_admins for each admin after submission creation' do
        admins = create_list(:admin, 3)
        submission = Submission.new(email: 'example@email.com', name: 'sub', song_title: 'title', genre: 'genre')
        submission.profile.attach(
          io: File.open(Rails.root.join('spec/fixtures/blank_profile_photo.jpeg')), 
          filename: 'blank_profile_photo.jpeg', 
          content_type: 'image/jpeg'
        )
        submission.video.attach(
          io: File.open(Rails.root.join('spec/fixtures/pexels_stock_video.mp4')), 
          filename: 'pexels_stock_video.mp4', 
          content_type: 'video/mp4'
        )

        expect(submission.submission_admins.count).to eq(0)
        submission.save!
        expect(submission.submission_admins.count).to eq(3)
        expect(submission.submission_admins.first).to be_a(SubmissionAdmin)
        expect(submission.submission_admins[0].admin_id).to eq(admins[0].id)
        expect(submission.submission_admins[1].admin_id).to eq(admins[1].id)
        expect(submission.submission_admins[2].admin_id).to eq(admins[2].id)
      end
    end
  end

  context 'instance methods' do
    describe '#admin_favorite' do
      it 'returns true when the submission is favorited by specific admin' do
        admin = create(:admin)
        submission = create(:submission)
        submission.submission_admins.first.update(favorite: true)


        expect(submission.admin_favorite(admin.id)).to eq(true)
      end
      
      it 'returns false when the submission is not favorited by specific admin' do
        admin = create(:admin)
        admin_favorite = create(:admin)
        
        submission = create(:submission)
        admin_favorite.submission_admins.first.update(favorite: true)        

        expect(submission.admin_favorite(admin.id)).to eq(false)
        expect(submission.admin_favorite(admin_favorite.id)).to eq(true)
      end
    end
  end
end
