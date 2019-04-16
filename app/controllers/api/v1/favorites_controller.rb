class Api::V1::FavoritesController < ApplicationController
skip_before_action :verify_authenticity_token
  def create
    user = User.find_by(api_key: params[:favorite][:api_key])
    if user
      location = Location.find_or_create_by(name: params[:favorite][:location])
      user.favorite_locations << location
    else
    end
  end
end
