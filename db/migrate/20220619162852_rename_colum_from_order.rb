class RenameColumFromOrder < ActiveRecord::Migration[6.1]
  def change
    rename_column :orders, :Contact_receiver, :contact_receiver
    rename_column :orders, :Contact_phone, :contact_phone
    rename_column :orders, :Contact_address, :contact_address
    rename_column :orders, :Sub_total, :sub_total
    rename_column :orders, :Discount, :discount
    rename_column :orders, :Status, :status
    rename_column :orders, :Note, :note
    rename_column :orders, :Order_date, :order_date
    rename_column :orders, :Delivery_date, :delivery_date
  end
end
