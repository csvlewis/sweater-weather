class GoogleMapsService
  def geocode(location)
    get_json("geocode/json?address=#{location}&key=#{ENV['GOOGLE_MAPS_API_KEY']}")
  end

  def get_json(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: 'https://maps.googleapis.com/maps/api/')
  end
end
