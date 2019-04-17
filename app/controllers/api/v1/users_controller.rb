class Api::V1::UsersController < Api::V1::BaseController
  skip_before_action :verify_authenticity_token
  def create
    user = UserCreator.new(params[:email], params[:password]).register_user if confirmed_password
    if confirmed_password && user
      render status: 201, json: api_key(user)
    else
      render status: 404, json: error_message
    end
  end
end
