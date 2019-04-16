class Api::V1::ForecastController < Api::V1::BaseController
  def show
    lat_long = geocode(params[:location])
    response = weather_service.forecast(lat_long[:lat], lat_long[:lng])
    render status: 200, json: ForecastFacade.new(response).to_json
  end

  private

  def geocode(location)
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
