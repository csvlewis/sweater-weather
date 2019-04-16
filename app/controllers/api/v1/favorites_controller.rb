class Api::V1::FavoritesController < Api::V1::BaseController
skip_before_action :verify_authenticity_token
  def create
    user = User.find_by(api_key: params[:favorite][:api_key])
    if user
      location = Location.find_or_create_by(name: params[:favorite][:location])
      user.locations << location unless user.locations.find_by(name: location.name)
      render status: 201, json: { message: "You have favorited #{location.name}!"}
    else
      render status: 404, json: { message: "There was an error with your request"}
    end
  end

  def destroy
    user = User.find_by(api_key: params[:favorite][:api_key])
    location = Location.find_by(name: params[:favorite][:location])
    if user.locations.include?(location)
      UserLocation.joins(:location)
                  .where(locations: { name: params[:favorite][:location] })
                  .first
                  .destroy
      render status: 200, json: { message: "You have unfavorited #{params[:favorite][:location]}!"}
    else
      render status: 404, json: { message: "There was an error with your request"}
    end

  end
end
