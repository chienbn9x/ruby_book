class Review < ApplicationRecord

  validates :Title, :Rating, presence: true
  validates :Rating, numericality: { in: 1..5 }

  belongs_to :user
  belongs_to :product
  has_many :sub_reviews, dependent: :delete_all
end
