require 'rails_helper'

describe 'Background API' do
  it 'returns a picture for a given location' do
    get '/api/v1/backgrounds?location=denver,co'

    parsed = JSON.parse(response.body, symbolize_names: true)
    expect(response).to be_successful
    expect(parsed[:results][0][:urls][:raw]).to be_a(String)
  end
end
