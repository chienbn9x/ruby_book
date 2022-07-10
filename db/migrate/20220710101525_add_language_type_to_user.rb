class AddLanguageTypeToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :display_language_type, :integer, :null => false, :default => 1
  end
end
