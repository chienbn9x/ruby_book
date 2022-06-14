class RenameColumToProduct < ActiveRecord::Migration[6.1]
  def change
    rename_column :products, :Title, :title
    rename_column :products, :Publication_year, :publication_year
    rename_column :products, :Authors, :authors
    rename_column :products, :Description, :description
    rename_column :products, :Price, :price
    rename_column :products, :Discount, :discount
    rename_column :products, :Final_price, :final_price
    rename_column :products, :Stop_business, :stop_business
  end
end
