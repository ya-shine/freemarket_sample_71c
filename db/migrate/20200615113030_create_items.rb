class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.text :description, null:false
      t.integer :price, null:false
      t.references :category, null:false, foreign_key: true
      t.references :size, null:false, foreign_key: true
      t.references :condition, null:false, foreign_key: true
      t.references :delivery_fee, null:false, foreign_key: true
      t.references :shipping_method, null:false, foreign_key: true
      t.references :ship_from_area, null:false, foreign_key: true
      t.references :shipping_day, null:false, foreign_key: true
      t.references :user, null:false, foreign_key: true
      t.timestamps
    end
  end
end
