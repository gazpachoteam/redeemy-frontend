class CreateRedeemables < ActiveRecord::Migration[5.2]
  def change
    create_table :redeemables do |t|
      t.string :name
      t.text :description
      t.string :category
      t.integer :provider_id

      t.timestamps
    end
  end
end
