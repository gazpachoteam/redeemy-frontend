class CreatePoints < ActiveRecord::Migration[5.2]
  def change
    create_table :points do |t|
      t.integer :account_id
      t.integer :point_type_id
      t.integer :cant_punt
      t.string :cod_progr

      t.timestamps null: true
    end
  end
end
