class CreateShipFromAreas < ActiveRecord::Migration[5.2]
  def change
    create_table :ship_from_areas do |t|
      
      t.timestamps
    end
  end
end
