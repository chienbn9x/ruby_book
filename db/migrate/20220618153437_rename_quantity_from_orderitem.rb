class RenameQuantityFromOrderitem < ActiveRecord::Migration[6.1]
  def change
    rename_column :orderitems, :Quantity, :quantity
  end
end
