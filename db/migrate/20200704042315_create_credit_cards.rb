class CreateCreditCards < ActiveRecord::Migration[5.2]
  def change
    create_table :credit_cards do |t|
      t.references :user, foreingn_key: true, null:false
      t.string :costomer_id, null:false
      t.string :card_id, null:false
      t.timestamps
    end
  end
end
