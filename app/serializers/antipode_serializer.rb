class AntipodeSerializer
  include FastJsonapi::ObjectSerializer
  attribute :location_name do |antipode|
    antipode.antipode_city
  end
  attribute :forecast do |antipode|
    {
      summary: antipode.forecast_summary,
      current_temperature: antipode.forecast_temperature
    }
  end
  attribute :search_location
end
