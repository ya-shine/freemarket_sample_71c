class CreateDeliveryFees < ActiveRecord::Migration[5.2]
  def change
    create_table :delivery_fees do |t|
      t.integer :delivery_fee_id
      t.string :name
      t.timestamps
    end
  end
end
