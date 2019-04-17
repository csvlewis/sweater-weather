class Finder
  def initialize(search)
    @search = search
  end

  def find_user_by_api_key
    User.find_by(api_key: @search)
  end

  def find_or_create_location_by_name
    location = Location.find_or_create_by(name: @search.downcase)
    lat, long = Geocoder.new(location.name).lat_long
    location.update(latitude: lat, longitude: long)
    location
  end

  def find_location_by_name
    Location.find_by(name: @search.downcase)
  end

  def find_user_by_email
    User.find_by(email: @search)
  end
end
