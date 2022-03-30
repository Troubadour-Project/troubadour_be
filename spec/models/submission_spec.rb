require 'rails_helper'

RSpec.describe Submission, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:song_title) }
    it { should validate_presence_of(:genre) }
    it { should validate_presence_of(:winner).allow_nil }
    it { should have_one_attached(:profile) }
    it { should have_one_attached(:video) }
  end
end
