class Address < ApplicationRecord

  validates :name, :contact_phone, :contact_address, presence: true
  validates :addr_default, inclusion: { in: [true, false] }

  belongs_to :user
end
