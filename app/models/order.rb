class Order < ApplicationRecord

  validates :Contact_receiver, :Contact_phone, :Contact_address, presence: true
  validates :Sub_total, :Discount, :Total, :Status, :Order_date, presence: true

  belongs_to :user
  belongs_to :orderstatus
  has_many :orderitems, dependent: :delete_all
end
