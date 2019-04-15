require 'rails_helper'

describe AntipodeCreator, type: :model do
  describe 'class methods' do
    describe 'create(location)' do
      it 'returns an antipode object for the given location' do
        antipode = AntipodeCreator.create('hongkong')

        expect(antipode).to be_a(Antipode)
        expect(antipode.antipode_city).to eq('Jujuy')
        expect(antipode.search_location).to eq('Kowloon')
        expect(antipode.forecast_summary).to be_a(String)
        expect(antipode.forecast_temperature).to be_a(Float)
      end
    end

    describe 'reverse_geocode(lat, long)' do
      it 'returns a city name for a given latitude and longitude' do
        city = AntipodeCreator.reverse_geocode(22.3193039, 114.1693611)

        expect(city).to eq('Kowloon')
      end
    end

    describe 'antipode(lat, long)' do
      it 'returns a latitude and longitude for the antipode of a location' do
        lat_long = AntipodeCreator.antipode(22.3193039, 114.1693611)

        expect(lat_long[:lat]).to eq(-22.3193039)
        expect(lat_long[:long]).to eq(-65.8306389)
      end
    end

    describe 'forecast(lat, long)' do
      it 'returns the current forecast for a given location' do
        forecast = AntipodeCreator.forecast(-22.3193039, -65.8306389)

        expect(forecast[:summary]).to be_a(String)
        expect(forecast[:temperature]).to be_a(Float)
      end
    end

    describe 'geocode(location)' do
      it 'returns the latitude and longitude for a given location' do
        lat_long = AntipodeCreator.geocode('hongkong')

        expect(lat_long[:lat]).to eq(22.3193039)
        expect(lat_long[:lng]).to eq(114.1693611)
      end
    end
  end
end
