require 'rails_helper'

describe 'Favorites API' do
  it 'can list favorite locations for a user' do
    api_key = 'jgn983hy48thw9begh98h4539h4'
    user = User.create(email: 'email', password: 'password', api_key: api_key)
    location1 = Location.create(name: 'Denver, CO', latitude: 45, longitude: 45)
    location2 = Location.create(name: 'Madison, WI', latitude: 45, longitude: 45)
    location3 = Location.create(name: 'Austin, TX', latitude: 45, longitude: 45)
    user.locations << location1
    user.locations << location2
    user.locations << location3
    body = {
      'api_key': api_key
    }

    get '/api/v1/favorites', params: { favorite: body }
    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(response.status).to eq(200)
    expect(parsed[0][:location]).to eq(location1.name)
    expect(parsed[1][:location]).to eq(location2.name)
    expect(parsed[2][:location]).to eq(location3.name)
  end

  it 'returns an error if an invalid api key is given' do
    api_key = 'jgn983hy48thw9begh98h4539h4'
    User.create(email: 'email', password: 'password', api_key: api_key)
    body = {
      'api_key': 'invalid_key'
    }

    get '/api/v1/favorites', params: { favorite: body }
    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(response.status).to eq(404)
    expect(parsed[:message]).to eq('There was an error with your request')
  end
end
