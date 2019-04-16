class Api::V1::UsersController < ApplicationController
skip_before_action :verify_authenticity_token
  def create
    if confirmed_password
      if params[:user]
        user = User.new(user_params)
      else
        user = User.new(email: params[:email],
                        password: params[:password],
                        password_confirmation: params[:password_confirmation])
      end
      set_user_api_key(user)
      if user.save
        render json: UserSerializer.new(user), status: 201
      else
        raise ActionController::RoutingError.new('Not Found')
      end
    else
      raise ActionController::RoutingError.new('Not Found')
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

  def set_user_api_key(user)
    key = SecureRandom.urlsafe_base64
    user.update(api_key: key)
  end

  def confirmed_password
    params[:password] == params[:password_confirmation]
  end
end
