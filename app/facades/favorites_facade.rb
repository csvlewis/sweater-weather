class FavoritesFacade
  def initialize(data)
    @locations = data
  end

  def to_json
    @locations.map do |location|
      {
        location: location.name,
        forecast: location_forecast(location)
      }
    end
  end

  def location_forecast(location)
    response = DarkSkyService.new.forecast(location.latitude, location.longitude)
    ForecastFacade.new(response).to_json
  end
end
