class UserCreator
  def initialize(email, password)
    @email = email
    @password = password
  end

  def self.register_user(email, password)
    new(email, password).register_user
  end

  def register_user
    user = Finder.find_user_by_email(@email)
    if user
      false
    else
      user = User.new(email: @email, password: @password)
      user.set_user_api_key
      user
    end
  end
end
