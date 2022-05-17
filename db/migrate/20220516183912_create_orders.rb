class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.string :Contact_receiver
      t.string :Contact_phone
      t.text :Contact_address
      t.float :Sub_total
      t.float :Discount
      t.float :Total
      t.integer :Status
      t.text :Note
      t.datetime :Order_date
      t.datetime :Delivery_date

      t.timestamps
    end
  end
end
