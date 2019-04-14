class Api::V1::ForecastController < ApplicationController
  def show
    response = location_service.geocode(params[:location])
    lat = response[:results][0][:geometry][:location][:lat]
    lng = response[:results][0][:geometry][:location][:lng]
    weather_service.forecast(lat, lng)
  end

  private

  def location_service
    GoogleMapsService.new
  end

  def weather_service
    DarkSkyService.new
  end
end
