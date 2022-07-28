class CreateProvince < ActiveRecord::Migration[6.1]
  def change
    create_table :provinces do |t|
      t.string :name
      t.string :type
      t.string :slug

      t.timestamps
    end
  end
end
