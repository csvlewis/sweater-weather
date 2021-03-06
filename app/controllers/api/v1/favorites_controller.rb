class Api::V1::FavoritesController < Api::V1::BaseController
  skip_before_action :verify_authenticity_token
  def index
    user = User.find_by(api_key: params[:favorite][:api_key])
    if user
      render status: 200, json: FavoritesFacade.new(user.locations).to_json
    else
      render status: 404, json: error_message
    end
  end

  def create
    user = User.find_by(api_key: params[:favorite][:api_key])
    if user
      location = LocationCreator.find_or_create_location_by_name(params[:favorite][:location])
      FavoriteManager.create_favorite(user, location)
      render status: 201, json: favorite_created(params[:favorite][:location])
    else
      render status: 404, json: error_message
    end
  end

  def destroy
    user = User.find_by(api_key: params[:favorite][:api_key])
    location = Location.find_by(name: params[:favorite][:location].downcase)
    if user && user.locations.include?(location)
      FavoriteManager.delete_favorite(user, location)
      render status: 200, json: favorite_deleted(params[:favorite][:location])
    else
      render status: 404, json: error_message
    end
  end
end
