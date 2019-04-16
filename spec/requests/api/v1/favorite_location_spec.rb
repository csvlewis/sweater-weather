require 'rails_helper'

describe 'Favorites API' do
  it 'can add a favorite location for a user' do
    api_key = 'jgn983hy48thw9begh98h4539h4'
    User.create(email: 'email', password: 'password', api_key: api_key)
    body = {
      'api_key': api_key
    }

    post '/api/v1/favorites', params: { favorite: body }

    expect(response).to be_successful
  end
end
