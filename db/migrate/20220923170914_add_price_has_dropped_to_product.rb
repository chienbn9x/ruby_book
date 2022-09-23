class AddPriceHasDroppedToProduct < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :price_has_dropped, :float
  end
end
