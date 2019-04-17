class Api::V1::BackgroundController < Api::V1::BaseController
  def show
    response = UnsplashService.new.background(params[:location])
    render status: 200, json: BackgroundFacade.new(response).to_json
  end
end
