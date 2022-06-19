class Orderitem < ApplicationRecord

  validates :quantity, presence: true

  belongs_to :order
  belongs_to :product
end
