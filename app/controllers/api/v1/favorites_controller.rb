class Api::V1::FavoritesController < Api::V1::BaseController
  skip_before_action :verify_authenticity_token
  def index
    user = find_user_by_api_key
    if user
      render status: 200, json: FavoritesFacade.new(user.locations).to_json
    else
      render status: 404, json: { message: 'There was an error with your request' }
    end
  end

  def create
    user = find_user_by_api_key
    location = find_or_create_location_by_name
    if user
      FavoriteManager.new(user, location).create_favorite
      render status: 201, json: { message: "You have favorited #{params[:favorite][:location]}" }
    else
      render status: 404, json: { message: 'There was an error with your request' }
    end
  end

  def destroy
    user = find_user_by_api_key
    location = find_location_by_name
    if user.has_location?(location) && user
      FavoriteManager.new(user, location).delete_favorite
      render status: 200, json: { message: "You have unfavorited #{params[:favorite][:location]}"}
    else
      render status: 404, json: { message: "There was an error with your request"}
    end
  end

  private

  def find_user_by_api_key
    User.find_by(api_key: params[:favorite][:api_key])
  end

  def find_location_by_name
    Location.find_by(name: params[:favorite][:location].downcase)
  end

  def find_or_create_location_by_name
    location = Location.find_or_create_by(name: params[:favorite][:location].downcase)
    lat, long = Geocoder.new(location.name).lat_long
    location.update(latitude: lat, longitude: long)
    location
  end
end
