class Orderstatus < ApplicationRecord

  validates :Status, :Update_time, presence: true

  belongs_to :order
end
