require 'rails_helper'

describe 'User login' do
  describe 'as a visitor' do
    describe 'when I visit login' do
      it 'I can login with a valid email and password' do
        User.create(email: 'whatever@example.com', password: 'password')
        visit '/login'

        fill_in 'Email', with: 'whatever@example.com'
        fill_in 'Password', with: 'password'
        click_button 'Login'
      end
    end
  end
end
