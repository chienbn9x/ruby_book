class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.references :product, null: false, foreign_key: true
      t.string :Title
      t.text :Content
      t.integer :Rating
      t.integer :Like_count

      t.timestamps
    end
  end
end
