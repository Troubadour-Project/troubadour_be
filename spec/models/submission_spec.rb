require 'rails_helper'

RSpec.describe Submission, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:email) }
  end
end
