class Orderstatus < ApplicationRecord

  validates :status, presence: true

  has_many :orders
end
