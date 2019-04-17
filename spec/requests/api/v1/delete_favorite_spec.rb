require 'rails_helper'

describe 'Favorites API' do
  it 'can delete a favorite location for a user' do
    api_key = 'jgn983hy48thw9begh98h4539h4'
    user = User.create(email: 'email', password: 'password', api_key: api_key)
    location = Location.create(name: 'denver, co')
    user.locations << location
    body = {
      'location': 'Denver, CO',
      'api_key': api_key
    }

    expect(user.locations.count).to eq(1)

    delete '/api/v1/favorites', params: { favorite: body }
    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(response.status).to eq(200)
    expect(parsed[:message]).to eq('You have unfavorited Denver, CO')
    expect(user.locations.count).to eq(0)
  end

  it 'returns an error if an invalid api key is given' do
    api_key = 'jgn983hy48thw9begh98h4539h4'
    user = User.create(email: 'email', password: 'password', api_key: api_key)
    location = Location.create(name: 'denver, co')
    user.locations << location
    body = {
      'location': 'Denver, CO',
      'api_key': 'invalid_key'
    }

    expect(user.locations.count).to eq(1)

    delete '/api/v1/favorites', params: { favorite: body }
    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(response.status).to eq(404)
    expect(parsed[:message]).to eq('There was an error with your request')
    expect(user.locations.count).to eq(1)
  end
end
