class InternalService
  def register(email, password, confirmation)
    post_json("?email=#{email}&password=#{password}&password_confirmation=#{confirmation}")
  end

  def post_json(url)
    conn.post(url)
  end

  def conn
    Faraday.new(url: 'http://localhost:3000/api/v1/users') do |faraday|
      faraday.headers['Content-Type'] = 'application/json'
      faraday.headers['Accept'] = 'application/json'
      faraday.adapter Faraday.default_adapter
    end
  end
end
