class Api::V1::AntipodeController < ApplicationController
  def show
    lat_long = geocode(params[:loc])
    search_location = reverse_geocode(lat_long[:lat], lat_long[:lng])
    anti_lat_long = antipode(lat_long[:lat], lat_long[:lng])
    forecast = forecast(anti_lat_long[:lat], anti_lat_long[:long])
    antipode_city = reverse_geocode(anti_lat_long[:lat], anti_lat_long[:long])
    antipode = Antipode.find_or_create_by(antipode_city: antipode_city,
                            search_location: search_location,
                            forecast_summary: forecast[:summary],
                            forecast_temperature: forecast[:temperature])
    render json: AntipodeSerializer.new(antipode)
  end

  private

  def antipode(lat, long)
    response = antipode_service.antipode(lat, long)
    response[:data][:attributes]
  end

  def reverse_geocode(lat, long)
    response = location_service.reverse_geocode(lat, long)
    city = response[:results][0][:address_components].select do |address|
      address.value?(%w[administrative_area_level_1 political])
    end
    city[0][:long_name]
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
