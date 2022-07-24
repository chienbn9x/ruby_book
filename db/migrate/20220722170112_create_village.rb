class CreateVillage < ActiveRecord::Migration[6.1]
  def change
    create_table :villages do |t|
      t.string :name
      t.string :type
      t.references :district, null: false, foreign_key: true

      t.timestamps
    end
  end
end
