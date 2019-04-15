require 'rails_helper'

describe GoogleMapsService do
  it 'exists' do
    service = GoogleMapsService.new

    expect(service).to be_a(GoogleMapsService)
  end

  describe 'instance methods' do
    describe '#geocode' do
      it 'returns json with information about a given location' do
        service = GoogleMapsService.new

        response = service.geocode('Denver, CO')

        expect(response[:results][0][:geometry][:location][:lat]).to be_a(Float)
        expect(response[:results][0][:geometry][:location][:lng]).to be_a(Float)
      end
    end

    describe '#reverse_geocode(lat, long)' do
      it 'returns json with a city for a given lat long' do
        service = GoogleMapsService.new

        response = service.reverse_geocode(-22.3193039, -65.8306389)

        binding.pry
        expect(response).to be_a(Float)

      end
    end
  end
end
