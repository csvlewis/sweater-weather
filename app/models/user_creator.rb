class UserCreator
  def initialize(email, password)
    @email = email
    @password = password
  end

  def self.register_user(email, password)
    new(email, password).register_user
  end

  def register_user
    user = User.new(email: @email, password: @password)
    user.set_user_api_key
    user
  end
end
