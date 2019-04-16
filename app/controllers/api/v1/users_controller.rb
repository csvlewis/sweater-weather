class Api::V1::UsersController < ApplicationController
  def create
    user = User.new(user_params) if confirmed_password
    set_user_api_key(user)
    if user.save
      render json: UserSerializer.new(user), status: 201
    else
      not_found
    end
  end

  private

  def set_user_api_key(user)
    key = SecureRandom.urlsafe_base64
    user.update(api_key: key)
  end

  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end

  def confirmed_password
    params[:password] == params[:password_confirmation]
  end

  def user_params
    params.permit(:email, :password)
  end
end
