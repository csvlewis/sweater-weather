class Api::V1::SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:session][:email])
    if user.password == params[:session][:password]
      session[:id] = user.id
      render json: UserSerializer.new(user)
    else
      raise ActionController::RoutingError.new('Not Found')
    end
  end
end
