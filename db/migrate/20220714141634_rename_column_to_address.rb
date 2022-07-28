class RenameColumnToAddress < ActiveRecord::Migration[6.1]
  def change
    rename_column :addresses, :Contact_phone, :contact_phone
    rename_column :addresses, :Contact_receiver, :contact_receiver
    rename_column :addresses, :Contact_address, :contact_address
    rename_column :addresses, :Addr_default, :addr_default
  end
end
