class Api::V1::ForecastController < ApplicationController
  def show
    lat_long = geocode_location(params[:location])
    render json: weather_service.forecast(lat_long[:lat], lat_long[:lng])
  end

  private

  def geocode_location(location)
    response = location_service.geocode(location)
    response[:results][0][:geometry][:location]
  end

  def location_service
    GoogleMapsService.new
  end

  def weather_service
    DarkSkyService.new
  end
end
