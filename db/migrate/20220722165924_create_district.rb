class CreateDistrict < ActiveRecord::Migration[6.1]
  def change
    create_table :districts do |t|
      t.string :name
      t.string :type
      t.references :province, null: false, foreign_key: true

      t.timestamps
    end
  end
end
