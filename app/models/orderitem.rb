class Orderitem < ApplicationRecord

  validates :Quantity, :Reviewed, presence: true

  belongs_to :order
  belongs_to :product
end
