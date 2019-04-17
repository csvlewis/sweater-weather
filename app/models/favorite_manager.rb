class FavoriteManager
  def initialize(user, location)
    @user = user
    @location = location
  end

  def create_favorite
    @user.locations << @location unless @user.has_location?(@location)
  end

  def delete_favorite
    UserLocation.joins(:location)
                .where(locations: { name: @location.name })
                .first
                .destroy
  end
end
