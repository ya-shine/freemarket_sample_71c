class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.references :user, foreign_key:true,null:false
      t.references :item, foreign_key:true,null:false
      t.string :receiver_last_name
      t.string :receiver_first_name
      t.string :zipcode,null: false
      t.string :prefecture,null:false
      t.string :city,null:false
      t.string :building,null:false
      t.timestamps
    end
  end
end
