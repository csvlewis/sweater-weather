class Geocoder
  def initialize(location)
    @location = location
  end

  def lat_long
    response = GoogleMapsService.new.geocode(@location)
    response[:results][0][:geometry][:location].values
  end
end
