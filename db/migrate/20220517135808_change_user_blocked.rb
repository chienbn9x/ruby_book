class ChangeUserBlocked < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :Blocked, :boolean, default: false
  end
end
