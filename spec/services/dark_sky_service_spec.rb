require 'rails_helper'

describe DarkSkyService do
  it 'exists' do
    service = DarkSkyService.new

    expect(service).to be_a(DarkSkyService)
  end

  describe 'instance methods' do
    describe '#forecast' do
      it 'returns json with weather data for a given location' do
        service = DarkSkyService.new
        lat = 39.7392358
        lng = -104.990251
        response = service.forecast(lat, lng)

        expect(response[:latitude]).to eq(lat)
        expect(response[:longitude]).to eq(lng)
        expect(response[:hourly][:data].count).to eq(49)
      end
    end
  end
end
