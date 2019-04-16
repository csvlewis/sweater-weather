class Api::V1::SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:session][:email])
    if user.authenticate(params[:session][:password])
      session[:id] = user.id
      render status: 200, json: { api_key: "#{user.api_key}" }
    else
      render status: 404, json: { message: "There was an error with your login" }
    end
  end
end
