class RemoveFinalPriceFromProduct < ActiveRecord::Migration[6.1]
  def change
    remove_column :products, :final_price, :float
  end
end
