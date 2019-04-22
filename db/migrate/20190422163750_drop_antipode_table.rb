class DropAntipodeTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :antipodes
  end
end
