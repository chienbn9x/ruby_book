class RemoveReviewedFromOrderitem < ActiveRecord::Migration[6.1]
  def change
    remove_column :orderitems, :Reviewed, :boolean
  end
end
