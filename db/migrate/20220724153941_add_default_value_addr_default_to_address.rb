class AddDefaultValueAddrDefaultToAddress < ActiveRecord::Migration[6.1]
  def change
    change_column :addresses, :addr_default, :boolean, null: false, default: false
  end
end
