class AddUserIdToAddress < ActiveRecord::Migration[6.1]
  def change
    add_reference :addresses, :user, null: false, foreign_key: true
  end
end
