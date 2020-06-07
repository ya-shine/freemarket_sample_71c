class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.text :description, null:false
      t.integer :price, null:false
      t.integer :condition, null:false
      t.string :delivery_fee, null:false
      t.string :ship_from_area, null:false
      t.string :shipping_method, null:false
      t.string :shipping_days, null:false
      t.boolean :selling_status, null:false
      t.references :user, null:false, foreign_key: true
      t.timestamps
    end
  end
end
