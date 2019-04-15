require 'rails_helper'

describe 'Users API' do
  it 'can register a user with an email and password' do

    params = {
    email: 'whatever@example.com',
    password: 'password',
    password_confirmation: 'password'
  }

    post '/api/v1/users', params: params
  end
end
