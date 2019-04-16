class AntipodeCreator
  def initialize(location)
    @location = location
  end

  def geocode
    @geocode ||= location_service.geocode(location)[:results][0][:geometry][:location]
  end

  def origin_lat
    geocode[:lat]
  end

  def origin_long
    geocode[:lng]
  end

  def reverse_geocode(lat, long)
    response = location_service.reverse_geocode(lat, long)
    city = response[:results][0][:address_components].select do |address|
      address.value?(%w[administrative_area_level_1 political])
    end
    city[0][:long_name]
  end

  def search_location
    reverse_geocode(origin_lat, origin_long)
  end

  def anti_lat_long
    antipode(origin_lat, origin_long)
  end

  def create





    lat_long = geocode(location)
    search_location = reverse_geocode(lat_long[:lat], lat_long[:lng])
    anti_lat_long = antipode(lat_long[:lat], lat_long[:lng])
    forecast = forecast(anti_lat_long[:lat], anti_lat_long[:long])
    antipode_city = reverse_geocode(anti_lat_long[:lat], anti_lat_long[:long])
    Antipode.find_or_create_by(antipode_city: antipode_city,
                               search_location: search_location,
                               forecast_summary: forecast[:summary],
                               forecast_temperature: forecast[:temperature])
  end

  def self.create(location)
    new(location).create
  end

  def self.reverse_geocode(lat, long)
    response = location_service.reverse_geocode(lat, long)
    city = response[:results][0][:address_components].select do |address|
      address.value?(%w[administrative_area_level_1 political])
    end
    city[0][:long_name]
  end

  def self.antipode(lat, long)
    AmypodeService.new.antipode(lat, long)[:data][:attributes]
  end

  def self.forecast(lat, long)
    DarkSkyService.new.forecast(lat, long)[:currently]
  end

  def self.geocode(location)
    location_service.geocode(location)[:results][0][:geometry][:location]
  end

  def self.location_service
    GoogleMapsService.new
  end
end
