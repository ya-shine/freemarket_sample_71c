class CreateShippingDays < ActiveRecord::Migration[5.2]
  def change
    create_table :shipping_days do |t|
      t.integer :shipping_day_id
      t.string :name
      t.timestamps
    end
  end
end
