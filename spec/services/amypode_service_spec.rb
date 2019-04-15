require 'rails_helper'

describe AmypodeService do
  it 'exists' do
    service = AmypodeService.new

    expect(service).to be_a(AmypodeService)
  end

  describe 'instance methods' do
    describe '#antipode' do
      it 'returns json with the lat and long for a location\'s antipode' do
        service = AmypodeService.new
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
