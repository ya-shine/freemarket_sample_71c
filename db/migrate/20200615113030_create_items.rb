class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.text :description, null:false
      t.integer :price, null:false
      t.integer :brand_id
      t.integer :condition_id, null:false
      t.integer :delivery_fee_id, null:false
      t.integer :shipping_method_id, null:false
      t.integer :ship_from_area_id, null:false
      t.integer :shipping_day_id, null:false
      t.references :category, null:false, foreign_key: true
      t.references :size, foreign_key: true
      t.references :user, null:false,foreign_key: true
      t.boolean :item_status, default: false, null: false
      t.timestamps
    end
  end
end
