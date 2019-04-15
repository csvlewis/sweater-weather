class Api::V1::AntipodeController < ApplicationController
  def show
    lat_long = geocode(params[:loc])
    antipode = antipode_service.antipode(lat_long[:lat], lat_long[:lng])
    weather_service.forecast(antipode[:data][:attributes][:lat], antipode[:data][:attributes][:long])
    binding.pry
  end

  private

  def geocode(location)
    response = location_service.geocode(location)
    response[:results][0][:geometry][:location]
  end

  def location_service
    GoogleMapsService.new
  end

  def antipode_service
    AmypodeService.new
  end

  def weather_service
    DarkSkyService.new
  end
end
