class Api::V1::ForecastController < Api::V1::BaseController
  def show
    lat, long = Geocoder.lat_long(params[:location])
    response = DarkSkyService.new.forecast(lat, long)
    render status: 200, json: ForecastFacade.new(response).to_json
  end
end
