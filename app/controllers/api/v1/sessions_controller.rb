class Api::V1::SessionsController < Api::V1::BaseController
  def create
    user = find_user_by_email
    if user.valid_password(params[:session][:password])
      render status: 200, json: { api_key: "#{user.api_key}" }
    else
      render status: 404, json: { message: "There was an error with your login" }
    end
  end

  private

  def find_user_by_email
    User.find_by(email: params[:session][:email])
  end
end
