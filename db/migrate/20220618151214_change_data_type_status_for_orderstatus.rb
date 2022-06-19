class ChangeDataTypeStatusForOrderstatus < ActiveRecord::Migration[6.1]
  def change
    rename_column :orderstatuses, :Status, :status
    change_column :orderstatuses, :status, :string
  end
end
