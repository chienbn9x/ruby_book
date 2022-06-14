class RemoveMainImageFromProduct < ActiveRecord::Migration[6.1]
  def change
    remove_column :products, :Main_image, :string
  end
end
