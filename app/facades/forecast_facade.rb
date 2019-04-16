class ForecastFacade
  attr_reader :locations
  def initialize(data)
    @latitude = data[:latitude]
    @longitude = data[:longitude]
    @current_time = data[:currently][:time]
    @current_summary = data[:currently][:summary]
    @hourly_summary = data[:hourly][:summary]
    @daily_summary = data[:daily][:summary]
    @current_icon = data[:currently][:icon]
    @current_temp = data[:currently][:temperature]
    @current_apparent_temp = data[:currently][:apparentTemperature]
    @current_humidity = data[:currently][:humidity]
    @current_visibility = data[:currently][:visibility]
    @current_uv_index = data[:currently][:uvIndex]
    @high_temp = data[:daily][:data][0][:temperatureHigh]
    @low_temp = data[:daily][:data][0][:temperatureLow]
    @one_hour_forecast_icon = data[:hourly][:data][1][:icon]
    @one_hour_forecast_time = data[:hourly][:data][1][:time]
    @one_hour_forecast_temp = data[:hourly][:data][1][:temperature]
    @two_hour_forecast_icon = data[:hourly][:data][2][:icon]
    @two_hour_forecast_time = data[:hourly][:data][2][:time]
    @two_hour_forecast_temp = data[:hourly][:data][2][:temperature]
    @three_hour_forecast_icon = data[:hourly][:data][3][:icon]
    @three_hour_forecast_time = data[:hourly][:data][3][:time]
    @three_hour_forecast_temp = data[:hourly][:data][3][:temperature]
    @four_hour_forecast_icon = data[:hourly][:data][4][:icon]
    @four_hour_forecast_time = data[:hourly][:data][4][:time]
    @four_hour_forecast_temp = data[:hourly][:data][4][:temperature]
    @five_hour_forecast_icon = data[:hourly][:data][5][:icon]
    @five_hour_forecast_time = data[:hourly][:data][5][:time]
    @five_hour_forecast_temp = data[:hourly][:data][5][:temperature]
    @six_hour_forecast_icon = data[:hourly][:data][6][:icon]
    @six_hour_forecast_time = data[:hourly][:data][6][:time]
    @six_hour_forecast_temp = data[:hourly][:data][6][:temperature]
    @seven_hour_forecast_icon = data[:hourly][:data][7][:icon]
    @seven_hour_forecast_time = data[:hourly][:data][7][:time]
    @seven_hour_forecast_temp = data[:hourly][:data][7][:temperature]
    @eight_hour_forecast_icon = data[:hourly][:data][8][:icon]
    @eight_hour_forecast_time = data[:hourly][:data][8][:time]
    @eight_hour_forecast_temp = data[:hourly][:data][8][:temperature]
    @one_day_forecast_time = data[:daily][:data][1][:time]
    @one_day_forecast_icon = data[:daily][:data][1][:icon]
    @one_day_forecast_precip_probability = data[:daily][:data][1][:precipProbability]
    @one_day_forecast_precip_type = data[:daily][:data][1][:precipType]
    @one_day_forecat_high_temp = data[:daily][:data][1][:temperatureHigh]
    @one_day_forecat_low_temp = data[:daily][:data][1][:temperatureLow]
    @two_day_forecast_time = data[:daily][:data][2][:time]
    @two_day_forecast_icon = data[:daily][:data][2][:icon]
    @two_day_forecast_precip_probability = data[:daily][:data][2][:precipProbability]
    @two_day_forecast_precip_type = data[:daily][:data][2][:precipType]
    @two_day_forecat_high_temp = data[:daily][:data][2][:temperatureHigh]
    @two_day_forecat_low_temp = data[:daily][:data][2][:temperatureLow]
    @three_day_forecast_time = data[:daily][:data][3][:time]
    @three_day_forecast_icon = data[:daily][:data][3][:icon]
    @three_day_forecast_precip_probability = data[:daily][:data][3][:precipProbability]
    @three_day_forecast_precip_type = data[:daily][:data][3][:precipType]
    @three_day_forecat_high_temp = data[:daily][:data][3][:temperatureHigh]
    @three_day_forecat_low_temp = data[:daily][:data][3][:temperatureLow]
    @four_day_forecast_time = data[:daily][:data][4][:time]
    @four_day_forecast_icon = data[:daily][:data][4][:icon]
    @four_day_forecast_precip_probability = data[:daily][:data][4][:precipProbability]
    @four_day_forecast_precip_type = data[:daily][:data][4][:precipType]
    @four_day_forecat_high_temp = data[:daily][:data][4][:temperatureHigh]
    @four_day_forecat_low_temp = data[:daily][:data][4][:temperatureLow]
    @five_day_forecast_time = data[:daily][:data][5][:time]
    @five_day_forecast_icon = data[:daily][:data][5][:icon]
    @five_day_forecast_precip_probability = data[:daily][:data][5][:precipProbability]
    @five_day_forecast_precip_type = data[:daily][:data][5][:precipType]
    @five_day_forecat_high_temp = data[:daily][:data][5][:temperatureHigh]
    @five_day_forecat_low_temp = data[:daily][:data][5][:temperatureLow]
  end

  def to_json
    {
      latitude: @latitude,
      longitude: @longitude,
      current_summary: @current_summary,
      current_icon: @current_icon,
      current_temp: @current_temp,
      high_temp: @high_temp,
      low_temp: @high_temp,

      one_hour_forecast_icon: @one_hour_forecast_icon,
      one_hour_forecast_time: @one_hour_forecast_time,
      one_hour_forecast_temp: @one_hour_forecast_temp,

      two_hour_forecast_icon: @two_hour_forecast_icon,
      two_hour_forecast_time: @two_hour_forecast_time,
      two_hour_forecast_temp: @two_hour_forecast_temp,

      three_hour_forecast_icon: @three_hour_forecast_icon,
      three_hour_forecast_time: @three_hour_forecast_time,
      three_hour_forecast_temp: @three_hour_forecast_temp,

      four_hour_forecast_icon: @four_hour_forecast_icon,
      four_hour_forecast_time: @four_hour_forecast_time,
      four_hour_forecast_temp: @four_hour_forecast_temp,

      five_hour_forecast_icon: @five_hour_forecast_icon,
      five_hour_forecast_time: @five_hour_forecast_time,
      five_hour_forecast_temp: @five_hour_forecast_temp,

      six_hour_forecast_icon: @six_hour_forecast_icon,
      six_hour_forecast_time: @six_hour_forecast_time,
      six_hour_forecast_temp: @six_hour_forecast_temp,

      seven_hour_forecast_icon: @seven_hour_forecast_icon,
      seven_hour_forecast_time: @seven_hour_forecast_time,
      seven_hour_forecast_temp: @seven_hour_forecast_temp,

      eight_hour_forecast_icon: @eight_hour_forecast_icon,
      eight_hour_forecast_time: @eight_hour_forecast_time,
      eight_hour_forecast_temp: @eight_hour_forecast_temp,

      one_day_forecast_precip_probability: @one_day_forecast_precip_probability,
      one_day_forecast_precip_type: @one_day_forecast_precip_type,
      one_day_forecast_high_temp: @one_day_forecat_high_temp,
      one_day_forecast_low_temp: @one_day_forecat_low_temp,

      two_day_forecast_precip_probability: @two_day_forecast_precip_probability,
      two_day_forecast_precip_type: @two_day_forecast_precip_type,
      two_day_forecast_high_temp: @two_day_forecat_high_temp,
      two_day_forecast_low_temp: @two_day_forecat_low_temp,

      three_day_forecast_precip_probability: @three_day_forecast_precip_probability,
      three_day_forecast_precip_type: @three_day_forecast_precip_type,
      three_day_forecast_high_temp: @three_day_forecat_high_temp,
      three_day_forecast_low_temp: @three_day_forecat_low_temp,

      four_day_forecast_precip_probability: @four_day_forecast_precip_probability,
      four_day_forecast_precip_type: @four_day_forecast_precip_type,
      four_day_forecast_high_temp: @four_day_forecat_high_temp,
      four_day_forecast_low_temp: @four_day_forecat_low_temp,

      five_day_forecast_precip_probability: @five_day_forecast_precip_probability,
      five_day_forecast_precip_type: @five_day_forecast_precip_type,
      five_day_forecast_high_temp: @five_day_forecat_high_temp,
      five_day_forecast_low_temp: @five_day_forecat_low_temp
    }
  end
end
