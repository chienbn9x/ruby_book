class AddRoleToCategory < ActiveRecord::Migration[6.1]
  def change
    add_column :categories, :role, :boolean, default: false
  end
end
