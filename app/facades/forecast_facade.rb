class ForecastFacade
  attr_reader :locations
  def initialize(data)
    binding.pry
    @latitude = data[:latitude]
    @longitude = data[:longitude]
    @current_summary = data[:currently][:summary]
    @future_summary = data[:hourly][:summary]
    @current_icon = data[:currently][:icon]
    @current_temp = data[:currently][:temperature]
    @current_apparent_temp = data[:currently][:apparentTemperature]
    @current_humidity = data[:currently][:humidity]
    @current_visibility = data[:currently][:visibility]
    @current_uv_index = data[:currently][:uvIndex]
    @high_temp = data[:daily][:data][0][:temperatureHigh]
    @low_temp = data[:daily][:data][0][:temperatureLow]
  end

  def to_json
    {
      latitude: @latitude,
      longitude: @longitude,
      current_summary: @current_summary,
      current_icon: @current_icon,
      current_temp: @current_temp,
      high_temp: @high_temp,
      low_temp: @high_temp
    }
  end
end
