class CreateShipFromAreas < ActiveRecord::Migration[5.2]
  def change
    create_table :ship_from_areas do |t|
      t.integer :ship_from_area_id
      t.string :name
      t.timestamps
    end
  end
end
