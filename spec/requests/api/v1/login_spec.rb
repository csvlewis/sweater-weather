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
    expect(parsed[:api_key]).to be_a(String)
  end

  it 'returns an error message if a user gives invalid credentials' do
    User.create(email: 'whatever@example.com', password: 'password', api_key: '123')

    body = {
      'email': 'invalid_email',
      'password': 'password'
    }

    post '/api/v1/sessions', params: { session: body }
    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(response.status).to eq(404)
    expect(parsed[:message]).to eq('There was an error with your request')

    body = {
      'email': 'whatever@example.com',
      'password': 'invalid_password'
    }

    post '/api/v1/sessions', params: { session: body }
    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(response.status).to eq(404)
    expect(parsed[:message]).to eq('There was an error with your request')
  end
end
