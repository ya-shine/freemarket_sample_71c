class CreateShippingMethods < ActiveRecord::Migration[5.2]
  def change
    create_table :shipping_methods do |t|
      t.integer :shipping_method_id
      t.string :name
      t.timestamps
    end
  end
end
