class CreatePromotions < ActiveRecord::Migration[6.1]
  def change
    create_table :promotions do |t|
      t.string :Title
      t.string :Code
      t.float :Discount_percent
      t.float :Discount_price
      t.integer :Discount_type
      t.float :Min_order_value
      t.float :Max_order_value
      t.date :Start_date
      t.date :End_date
      t.integer :Number_of_use

      t.timestamps
    end
  end
end
