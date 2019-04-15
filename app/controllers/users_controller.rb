class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    binding.pry
    user = User.new(user_params) if confirmed_password
    set_user_api_key(user)
    if user.save
      render json: UserSerializer.new(user), status: 201
    else
      @user = User.new
      flash[:error] = 'There was a problem registering'
      render :new
    end
  end
  private
  #
  # def set_user_api_key(user)
  #   key = SecureRandom.urlsafe_base64
  #   user.update(api_key: key)
  # end
  #
  # def confirmed_password
  #   params[:password] == params[:password_confirmation]
  # end
  #
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
