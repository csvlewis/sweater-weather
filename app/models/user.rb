class User < ApplicationRecord
  has_secure_password
  validates_presence_of :email
  validates_uniqueness_of :email
  validates_presence_of :password

  has_many :user_locations
  has_many :locations, through: :user_locations

  def valid_password(password)
    authenticate(password)
  end

  def has_location?(location)
    locations.include?(location)
  end

  def set_user_api_key
    key = SecureRandom.urlsafe_base64
    update(api_key: key)
  end
end
