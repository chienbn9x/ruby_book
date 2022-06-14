class RemoveAmountFromProduct < ActiveRecord::Migration[6.1]
  def change
    remove_column :products, :Amount, :integer
  end
end
