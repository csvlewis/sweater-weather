require 'rails_helper'

describe 'User Registration' do
  describe 'as a visitor' do
    describe 'when I visit sign-up' do
      it 'I can create an account with an email and password' do
        expect(User.all.count).to eq(0)
        visit '/sign-up'

        fill_in 'email', with: 'whatever@example.com'
        fill_in 'password', with: 'password'
        fill_in 'password_confirmation', with: 'password'
        click_button 'Sign Up'

        expect(current_path).to eq('/')
        expect(User.all.count).to eq(1)
        expect(User.first.email).to eq('whatever@example.com')
      end
    end
  end
end
