class AddExpirationToRedeemables < ActiveRecord::Migration[5.2]
  def change
    add_column :redeemables, :expiration, :date
  end
end
