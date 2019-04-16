require 'rails_helper'

describe 'Forecast API' do
  it 'returns the weather forecast for a given location' do
    get '/api/v1/forecast?location=denver,co'

    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(parsed[:latitude]).to eq(39.7392358)
    expect(parsed[:longitude]).to eq(-104.990251)
  end
end
