class CreateAntipodes < ActiveRecord::Migration[5.2]
  def change
    create_table :antipodes do |t|
      t.string :antipode_city
      t.string :search_location
      t.string :forecast_summary
      t.float :forecast_temperature
      t.timestamps
    end
  end
end
