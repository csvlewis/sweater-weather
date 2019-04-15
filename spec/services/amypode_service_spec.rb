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
        lat = 22.3193039
        lng = 114.1693611
        response = service.antipode(lat, lng)

        expect(response[:data][:attributes][:lat]).to eq(-22.3193039)
        expect(response[:data][:attributes][:long]).to eq(-65.8306389)
      end
    end
  end
end
