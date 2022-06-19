class RemoveOrderIdFromOrderstatus < ActiveRecord::Migration[6.1]
  def change
    remove_reference :orderstatuses, :order, null: false, foreign_key: true
  end
end
