class Order < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :orderstatus
  has_many :orderitems, dependent: :delete_all

end
