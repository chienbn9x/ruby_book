class CreateOrderitems < ActiveRecord::Migration[6.1]
  def change
    create_table :orderitems do |t|
      t.references :order, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.integer :Quantity
      t.boolean :Reviewed

      t.timestamps
    end
  end
end
