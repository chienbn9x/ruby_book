class RemoveUserFromOrder < ActiveRecord::Migration[6.1]
  def change
    remove_reference :orders, :user, null: false, foreign_key: true
  end
end
