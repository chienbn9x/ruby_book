class RemoveUrlFromProduct < ActiveRecord::Migration[6.1]
  def change
    remove_column :products, :Url, :string
  end
end
