require 'rails_helper'

describe 'Antipode API' do
  it 'can determine the weather forecast for a given location\'s antipode' do


    get '/api/v1/antipode?loc=hongkong'

    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(parsed[:data][0][:id]).to eq(1)
    expect(parsed[:data][0][:search_location]).to eq("Hong Kong")
    expect(parsed[:data][0][:attributes][:forecast][:summary]).to be_a(String)
    expect(parsed[:data][0][:attributes][:forecast][:current_temperature]).to be_a(Integer)
    expect(parsed[:data][0][:attributes][:location_name]).to eq("Antipode City Name")
  end
end
