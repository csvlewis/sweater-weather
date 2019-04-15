require 'rails_helper'

describe 'User Registration' do
  describe 'as a visitor' do
    describe 'when I visit sign-up' do
      it 'I can create an account with an email and password' do
        expect(User.all.count).to eq(0)
        visit '/sign-up'

        fill_in 'Email', with: 'whatever@example.com'
        fill_in 'Password', with: 'password'
        fill_in 'Password confirmation', with: 'password'
        click_button 'Create User'

        expect(current_path).to eq('/')
        expect(User.all.count).to eq(1)
        expect(User.first.email).to eq('whatever@example.com')
      end
    end
  end
end
