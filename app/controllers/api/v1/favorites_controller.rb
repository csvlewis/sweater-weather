class Api::V1::FavoritesController < Api::V1::BaseController
  skip_before_action :verify_authenticity_token
  def index
    user = Finder.new(params[:favorite][:api_key]).find_user_by_api_key
    if user
      render status: 200, json: FavoritesFacade.new(user.locations).to_json
    else
      render status: 404, json: error_message
    end
  end

  def create
    user = Finder.new(params[:favorite][:api_key]).find_user_by_api_key
    location = Finder.new(params[:favorite][:location]).find_or_create_location_by_name
    if user
      FavoriteManager.new(user, location).create_favorite
      render status: 201, json: favorite_created(params[:favorite][:location])
    else
      render status: 404, json: error_message
    end
  end

  def destroy
    user = Finder.new(params[:favorite][:api_key]).find_user_by_api_key
    location = Finder.new(params[:favorite][:location]).find_location_by_name
    if user.locations.include?(location) && user
      FavoriteManager.new(user, location).delete_favorite
      render status: 200, json: favorite_deleted(params[:favorite][:location])
    else
      render status: 404, json: error_message
    end
  end
end
