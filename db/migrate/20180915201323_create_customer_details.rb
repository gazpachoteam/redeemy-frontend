class CreateCustomerDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :customer_details do |t|
      t.integer :customer_id
      t.string :name
    end
  end
end
