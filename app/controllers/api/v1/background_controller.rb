class Api::V1::BackgroundController < Api::V1::BaseController
  def show
    render json: UnsplashService.new.background(params[:location])
  end
end
