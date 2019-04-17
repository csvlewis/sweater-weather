require 'rails_helper'

describe 'Background API' do
  it 'returns a picture for a given location' do
    get '/api/v1/backgrounds?location=denver,co'

    parsed = JSON.parse(response.body, symbolize_names: true)
    expect(response.status).to eq(200)
    expect(parsed[:url]).to be_a(String)
  end
end
