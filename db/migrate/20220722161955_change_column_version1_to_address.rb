class ChangeColumnVersion1ToAddress < ActiveRecord::Migration[6.1]
  def change
    remove_column :addresses, :contact_receiver
    add_column :addresses, :name, :string
  end
end
