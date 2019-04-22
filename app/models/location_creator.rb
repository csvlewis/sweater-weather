class LocationCreator
  def initialize(search)
    @search = search
  end

  def self.find_or_create_location_by_name(location)
    new(location).find_or_create_location_by_name
  end

  def find_or_create_location_by_name
    location = Location.find_or_create_by(name: @search.downcase)
    lat, long = Geocoder.lat_long(location.name)
    location.update(latitude: lat, longitude: long)
    location
  end
end
