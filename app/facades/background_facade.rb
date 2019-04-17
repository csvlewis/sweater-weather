class BackgroundFacade
  def initialize(data)
    @url = data[:results][0][:urls][:raw]
  end

  def to_json
    {
      url: @url
    }
  end
end
