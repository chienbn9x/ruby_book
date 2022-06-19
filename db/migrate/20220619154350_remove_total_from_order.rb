class RemoveTotalFromOrder < ActiveRecord::Migration[6.1]
  def change
    remove_column :orders, :Total, :float
  end
end
