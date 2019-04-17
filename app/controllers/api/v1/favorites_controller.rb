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
    if user
      create_and_save_location(user)
      render status: 201, json: { message: "You have favorited #{params[:favorite][:location]}" }
    else
      render status: 404, json: { message: 'There was an error with your request' }
    end
  end

  def destroy
    user = find_user_by_api_key
    if user_has_location? && user
      delete_user_location
      render status: 200, json: { message: "You have unfavorited #{params[:favorite][:location]}"}
    else
      render status: 404, json: { message: "There was an error with your request"}
    end
  end

  private

  def delete_user_location
    UserLocation.joins(:location)
                .where(locations: { name: params[:favorite][:location] })
                .first
                .destroy
  end

  def create_and_save_location(user)
    lat, long = Geocoder.new(params[:favorite][:location]).lat_long
    location = Location.find_or_create_by(name: params[:favorite][:location].downcase,
                               latitude: lat,
                               longitude: long)
    user.locations << location unless user_has_location?
  end

  def find_user_by_api_key
    User.find_by(api_key: params[:favorite][:api_key])
  end

  def user_has_location?
    user = User.find_by(api_key: params[:favorite][:api_key])
    location = Location.find_by(name: params[:favorite][:location])
    user.locations.include?(location)
  end
end
