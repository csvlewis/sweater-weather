require 'rails_helper'

describe 'Users API' do
  it 'can register a user with an email and password' do
    expect(User.all.count).to eq(0)
    body = {
      email: 'whatever@example.com',
      password: 'password',
      password_confirmation: 'password'
    }

    post '/api/v1/users', params: body
    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(response.status).to eq(201)
    expect(parsed[:api_key]).to be_a(String)
    expect(User.all.count).to eq(1)
    expect(User.first.email).to eq('whatever@example.com')
    expect(User.first.authenticate('password')).to eq(User.first)
  end

  describe 'returns an error if' do
    it 'a user\'s password is not confirmed properly' do
      expect(User.all.count).to eq(0)
      body = {
        email: 'whatever@example.com',
        password: 'password',
        password_confirmation: 'invalid_password'
      }

      post '/api/v1/users', params: body
      parsed = JSON.parse(response.body, symbolize_names: true)

      expect(response.status).to eq(404)
      expect(parsed[:message]).to eq('There was an error with your request')
      expect(User.all.count).to eq(0)
    end
  end

  it 'a user tries to create an account with an existing email' do
    User.create(email: 'whatever@example.com', password: 'password')
    body = {
      email: 'whatever@example.com',
      password: 'password',
      password_confirmation: 'password'
    }

    expect(User.all.count).to eq(1)
    post '/api/v1/users', params: body
    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(response.status).to eq(404)
    expect(parsed[:message]).to eq('There was an error with your request')
    expect(User.all.count).to eq(1)
  end
end
