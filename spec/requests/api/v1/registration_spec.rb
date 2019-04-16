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
end
