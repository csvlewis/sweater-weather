require 'rails_helper'

describe 'Users API' do
  it 'can login a user with a valid email and password' do
    User.create(email: 'whatever@example.com', password: 'password', api_key: '123')

    body = {
      'email': 'whatever@example.com',
      'password': 'password'
    }

    post '/api/v1/sessions', params: { session: body }

    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(response.status).to eq(200)
    expect(parsed[:data][:attributes][:api_key]).to be_a(String)
  end
end
