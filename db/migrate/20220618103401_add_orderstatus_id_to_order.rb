class AddOrderstatusIdToOrder < ActiveRecord::Migration[6.1]
  def change
    add_reference :orders, :orderstatus, null: false, foreign_key: true
  end
end
