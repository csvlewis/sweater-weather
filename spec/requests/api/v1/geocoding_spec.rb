require 'rails_helper'

describe 'Forecast API' do
  it 'can determine the weather for a given location' do
    headers = {
      'CONTENT-TYPE' => 'application/json',
      'ACCEPT' => 'application/json'
    }

    get '/api/v1/forecast?location=denver,co', headers: headers
  end
end
