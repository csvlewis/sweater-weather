require 'rails_helper'

RSpec.describe Antipode, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:antipode_city) }
    it { should validate_presence_of(:search_location) }
    it { should validate_presence_of(:forecast_summary) }
    it { should validate_presence_of(:forecast_temperature) }
  end
end
