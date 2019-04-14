class Api::V1::GeocodingController < ApplicationController
  def show
    binding.pry
    service.geocode(location)
  end

  private

  def service
    GoogleMapsService.new
  end
end
