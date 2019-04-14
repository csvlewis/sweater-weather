require 'rails_helper'

describe 'Forecast API' do
  it 'can determine the weather forecast for a given location' do
    headers = {
      'CONTENT-TYPE' => 'application/json',
      'ACCEPT' => 'application/json'
    }

    get '/api/v1/forecast?location=denver,co', headers: headers

    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(parsed[:latitude]).to eq(39.7392358)
    expect(parsed[:longitude]).to eq(-104.990251)
    expect(parsed[:hourly][:data].count).to eq(49)
  end
end
