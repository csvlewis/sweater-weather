class Antipode < ApplicationRecord
  validates_presence_of :antipode_city
  validates_presence_of :search_location
  validates_presence_of :forecast_summary
  validates_presence_of :forecast_temperature
end
