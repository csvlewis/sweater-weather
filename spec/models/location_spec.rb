require 'rails_helper'

RSpec.describe Location, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
  end

  describe 'relationships' do
    it { should have_many(:users).through(:user_locations) }
    it { should have_many(:user_locations) }
  end
end
