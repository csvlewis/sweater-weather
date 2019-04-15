class Api::V1::AntipodeController < ApplicationController
  def show
    lat_long = geocode(params[:loc])
    search_location = reverse_geocode(lat_long[:lat], lat_long[:lng])
    anti_lat_long = antipode(lat_long[:lat], lat_long[:lng])
    forecast = forecast(anti_lat_long[:lat], anti_lat_long[:long])
    antipode_city = reverse_geocode(anti_lat_long[:lat], anti_lat_long[:long])
    Antipode.new()
    binding.pry
  end

  private

  def antipode(lat, long)
    response = antipode_service.antipode(lat, long)
    response[:data][:attributes]
  end

  def reverse_geocode(lat, long)
    response = location_service.reverse_geocode(lat, long)
    response[:results][0][:address_components][1][:long_name]
  end

  def forecast(lat, long)
    response = weather_service.forecast(lat, long)
    response[:currently]
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
