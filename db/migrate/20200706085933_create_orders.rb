class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.references :seller, foreign_key:{to_table: :users},null:false
      t.references :buyer, foreign_key:{to_table: :users},null:false
      t.references :item, foreign_key:true,null:false
      t.string :receiver_last_name
      t.string :receiver_first_name
      t.string :zipcode, null: false
      t.string :prefecture, null:false
      t.string :city, null:false
      t.string :address, null:false
      t.string :building
      t.timestamps
    end
  end
end
