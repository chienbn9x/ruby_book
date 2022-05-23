class Address < ApplicationRecord

  validates :Contact_receiver, :Contact_phone, :Contact_address, :Addr_default, presence: true

  belongs_to :user
end
