class CreateShippingAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :shipping_addresses do |t|
      t.references :user, foreign_key: true, null: false
      t.string :zipcode, null: false
      t.integer :prefecture, null: false
      t.string :city, null: false
      t.string :address, null: false
      t.string :building
      t.string :phone_number
      t.timestamps
    end
  end
end
