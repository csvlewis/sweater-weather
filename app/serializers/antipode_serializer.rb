class AntipodeSerializer
  include FastJsonapi::ObjectSerializer
  attribute :location_name, &:antipode_city
  attribute :forecast do |antipode|
    {
      summary: antipode.forecast_summary,
      current_temperature: antipode.forecast_temperature
    }
  end
  attribute :search_location
end
