class Category < ApplicationRecord

    validates :name, presence: true

    has_many :products, dependent: :delete_all
end
