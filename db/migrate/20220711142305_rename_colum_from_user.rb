class RenameColumFromUser < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :Birthday, :birthday
    rename_column :users, :Gender, :gender
    rename_column :users, :Phone, :phone
    rename_column :users, :Wishlist, :wishlist
    rename_column :users, :Blocked, :blocked
  end
end
