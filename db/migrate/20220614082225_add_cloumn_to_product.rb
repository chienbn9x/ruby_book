class AddCloumnToProduct < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :height, :integer
    add_column :products, :width, :integer
    add_column :products, :translator, :string
    add_column :products, :publication_company, :string
    add_column :products, :layout, :string
    add_column :products, :number_page, :integer
    add_column :products, :weight, :integer
  end
end
