class Api::V1::SessionsController < Api::V1::BaseController
  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      render status: 200, json: { api_key: "#{user.api_key}" }
    else
      render status: 404, json: error_message
    end
  end
end
