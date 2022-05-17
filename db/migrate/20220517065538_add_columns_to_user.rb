class AddColumnsToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :fullName, :string
    add_column :users, :Birthday, :date
    add_column :users, :Gender, :boolean
    add_column :users, :Phone, :string
    add_column :users, :Wishlist, :string
    add_column :users, :Blocked, :boolean
  end
end
