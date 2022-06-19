class Order < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :orderstatus
  has_many :orderitems, dependent: :delete_all

  def cart_size
    order_items = self.orderitems
    size = order_items.map(&:quantity).sum
    
    size
  end
end
