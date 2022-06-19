class RemoveUpdatetimeFromOrderstatus < ActiveRecord::Migration[6.1]
  def change
    remove_column :orderstatuses, :Update_time, :datetime
  end
end
