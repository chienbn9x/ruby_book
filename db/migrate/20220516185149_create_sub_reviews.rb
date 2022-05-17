class CreateSubReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :sub_reviews do |t|
      t.references :review, null: false, foreign_key: true
      t.text :Content

      t.timestamps
    end
  end
end
