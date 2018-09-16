class CreateRedemptions < ActiveRecord::Migration[5.2]
  def change
    create_table :redemptions do |t|
      t.integer :customer_id
      t.integer :redeemable_id
      t.integer :points

      t.timestamps
    end
  end
end
