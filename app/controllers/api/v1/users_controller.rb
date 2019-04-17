class Api::V1::UsersController < Api::V1::BaseController
skip_before_action :verify_authenticity_token
  def create
    if confirmed_password
      user = register_user
      if user
        render status: 201, json: { api_key: user.api_key.to_s }
      else
        render status: 404, json: { message: "There was an error with your registration" }
      end
    else
      render status: 404, json: { message: "Your passwords do not match" }
    end
  end

  private

  def register_user
    user = User.new(email: params[:email], password: params[:password])
    set_user_api_key(user)
    user
  end

  def set_user_api_key(user)
    key = SecureRandom.urlsafe_base64
    user.update(api_key: key)
  end

  def confirmed_password
    params[:password] == params[:password_confirmation]
  end
end
