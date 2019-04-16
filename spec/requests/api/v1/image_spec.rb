require 'rails_helper'

describe 'Background API' do
  it 'returns a picture for a given location' do
    headers = {
      'CONTENT-TYPE' => 'application/json',
      'ACCEPT' => 'application/json'
    }

    get '/api/v1/backgrounds?location=denver,co', headers: headers

    parsed = JSON.parse(response.body, symbolize_names: true)
    binding.pry
    expect(response).to be_successful
    expect(parsed[:results][0][:urls][:raw]).to be_a(String)
  end
end
