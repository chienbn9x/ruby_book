class SubReview < ApplicationRecord

  validates :Content, presence: true

  belongs_to :user
  belongs_to :review
end
