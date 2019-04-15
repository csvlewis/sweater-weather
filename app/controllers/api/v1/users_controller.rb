class Api::V1::UsersController < ApplicationController
  def create
    user = User.new(user_params) if confirmed_password
    render json: UserSerializer.new(user) if user.save
  end

  private

  def confirmed_password
    params[:password] == params[:password_confirmation]
  end

  def user_params
    params.permit(:email, :password)
  end
end
