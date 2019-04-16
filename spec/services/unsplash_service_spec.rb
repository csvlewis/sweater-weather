require 'rails_helper'

describe UnsplashService do
  it 'exists' do
    service = UnsplashService.new

    expect(service).to be_a(UnsplashService)
  end

  describe 'instance methods' do
    describe '#background' do
      it 'returns a background image for a given location' do
        service = UnsplashService.new

        response = service.background('denver, co')

        expect(response[:results][0][:urls][:raw]).to be_a(String)
      end
    end
  end
end
