class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.text :description, null:false
      t.integer :price, null:false
      t.integer :condition, null:false
      t.references :delivery_fee, null:false
      t.references :ship_from_area, null:false
      t.references :shipping_method, null:false
      t.references :shipping_day, null:false
      t.references :selling_status, null:false
      t.references :user, null:false, foreign_key: true
      t.timestamps
    end
  end
end
