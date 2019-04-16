class UnsplashService
  def background(location)
    location = parse(location)
    get_json("?query=#{location}&page=1&per_page=1")
  end

  def get_json(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    binding.pry
    Faraday.new(url: 'https://api.unsplash.com/search/photos') do |faraday|
      faraday.headers['Authorization'] = "Bearer #{ENV['UNSPLASH_API_KEY']}"
      faraday.adapter Faraday.default_adapter
    end
  end

  def parse(location)
    if location.include?(',')
      location.split(',')[0]
    else
      location
    end
  end
end
