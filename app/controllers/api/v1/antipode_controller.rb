class Api::V1::AntipodeController < ApplicationController
  def show
    lat_long = geocode(params[:loc])
    anti_lat_long = antipode(lat_long[:lat], lat_long[:lng])
    forecast = weather_service.forecast(anti_lat_long[:lat], anti_lat_long[:long])
    binding.pry
    antipode_city = location_service.reverse_geocode(anti_lat_long[:lat], anti_lat_long[:long])
  end

  private

  def antipode(lat, long)
    response = antipode_service.antipode(lat, long)
    response[:data][:attributes]
  end

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
