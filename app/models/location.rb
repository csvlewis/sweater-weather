class Location < ApplicationRecord
  validates_presence_of :name

  has_many :user_locations
  has_many :users, through: :user_locations
end
