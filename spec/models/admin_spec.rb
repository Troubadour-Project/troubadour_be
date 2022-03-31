require 'rails_helper'

RSpec.describe Admin, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:email) }
  end

  describe 'factory model' do
    it 'exists with attributes' do
      admin = build(:admin, username: 'best_admin88', email: 'example@email.com')

      expect(admin).to be_a(Admin)
      expect(admin).to have_attributes(username: 'best_admin88')
      expect(admin).to have_attributes(email: 'example@email.com')
    end
  end
end
