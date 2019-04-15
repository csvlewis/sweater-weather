class AmypodeService
  def antipode(lat, lng)
    get_json("#{ENV['DARK_SKY_API_KEY']}/#{lat},#{lng}")
  end

  def get_json(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: 'https://api.darksky.net/forecast/')
  end
end
