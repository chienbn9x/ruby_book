class CreateOrderstatuses < ActiveRecord::Migration[6.1]
  def change
    create_table :orderstatuses do |t|
      t.references :order, null: false, foreign_key: true
      t.integer :Status
      t.datetime :Update_time

      t.timestamps
    end
  end
end
