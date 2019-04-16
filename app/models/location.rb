class Location < ApplicationRecord
  validates_presence_of :name

  has_many :user_locations
  has_many :users, through: :user_locations

  def forecast
    response = DarkSkyService.new.forecast(self.latitude, self.longitude)
    ForecastFacade.new(response).to_json
  end
end
