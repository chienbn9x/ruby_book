class Product < ApplicationRecord

  validates :Url, :Title, :Publication_year, :Authors, :Description, :Main_image, :Price, presence: true
  validates :Discount, :Final_price, :Amount, :Stop_business, presence: true
  validates :Url, uniqueness: true

  belongs_to :category
  has_many :orderitems, dependent: :delete_all
  has_many :reviews, dependent: :delete_all
end
