class AntipodeSerializer
  include FastJsonapi::ObjectSerializer
  attribute :location_name do |object|
    object.antipode_city
  end
  attribute :forecast do |object|
    {
      summary: object.forecast_summary,
      current_temperature: object.forecast_temperature
    }
  end
  attribute :search_location
end
