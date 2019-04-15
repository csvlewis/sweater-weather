class AmypodeService
  def antipode(lat, lng)
    get_json("antipodes?lat=#{lat}&long=#{lng}")
  end

  def get_json(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: 'http://amypode.herokuapp.com/api/v1/') do |faraday|
      faraday.headers['api_key'] = 'oscar_the_grouch'
      faraday.adapter Faraday.default_adapter
    end
  end
end
