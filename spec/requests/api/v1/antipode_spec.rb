require 'rails_helper'

describe 'Antipode API' do
  it 'can determine the weather forecast for a given location\'s antipode' do


    get '/api/v1/antipode?loc=hongkong'

    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(parsed[:data][:id]).to eq("1")
    expect(parsed[:data][:type]).to eq("antipode")
    expect(parsed[:data][:attributes][:location_name]).to eq("Jujuy")
    expect(parsed[:data][:attributes][:forecast][:summary]).to be_a(String)
    expect(parsed[:data][:attributes][:forecast][:current_temperature]).to be_a(Integer)
    expect(parsed[:data][:attributes][:search_location]).to eq("Kowloon")
  end
end
