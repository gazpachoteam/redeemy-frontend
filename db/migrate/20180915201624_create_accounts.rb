class CreateAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :accounts do |t|
      t.integer :customer_id
      t.string :cod_cuent
      t.date :fec_alta
      t.date :fec_baja
      t.date  :fec_acti
      t.string :cod_progr

      t.timestamps null: true
    end
  end
end
