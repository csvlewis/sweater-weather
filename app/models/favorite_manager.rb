class FavoriteManager
  def initialize(user, location)
    @user = user
    @location = location
  end

  def self.create_favorite(user, location)
    new(user, location).create_favorite
  end

  def self.delete_favorite(user, location)
    new(user, location).delete_favorite
  end

  def create_favorite
    @user.locations << @location unless @user.locations.include?(@location)
  end

  def delete_favorite
    UserLocation.joins(:location, :user)
                .where(locations: { name: @location.name })
                .where(users: { email: @user.email })
                .first
                .destroy
  end
end
