class CreatePointTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :point_types do |t|
      t.string :name
      t.timestamps null: true
    end
  end
end
