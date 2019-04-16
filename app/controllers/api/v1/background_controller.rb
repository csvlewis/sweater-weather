class Api::V1::BackgroundController < ApplicationController
  def show
    render json: UnsplashService.new.background(params[:location])
  end
end
