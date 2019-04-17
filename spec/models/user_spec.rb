require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
    it { should validate_presence_of(:password) }
  end

  describe 'relationships' do
    it { should have_many(:locations).through(:user_locations) }
    it { should have_many(:user_locations) }
  end

  describe 'instance methods' do
    describe '#set_user_api_key' do
      it 'sets or updates a random api key for a user' do
        user = User.create(email: 'email', password: 'password')

        expect(user.api_key).to eq(nil)

        user.set_user_api_key

        expect(user.api_key).to be_a(String)
      end
    end
  end
end
