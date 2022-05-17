class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.references :category, null: false, foreign_key: true
      t.string :Url
      t.text :Title
      t.string :Publication_year
      t.text :Authors
      t.text :Description
      t.string :Main_image
      t.float :Price
      t.float :Discount
      t.float :Final_price
      t.integer :Amount
      t.boolean :Stop_business

      t.timestamps
    end
  end
end
