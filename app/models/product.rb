class Product < ApplicationRecord

  before_save :save_price_has_dropped

  validates :title, :authors, :price, presence: true
  validates :height, :width, :weight, :layout, :number_page, presence: true

  belongs_to :category
  has_many :orderitems, dependent: :delete_all
  has_many :reviews, dependent: :delete_all

  # active storage
  has_many_attached :images, dependent: :delete_all

  # action text
  has_rich_text :description

  before_save :set_stop_business

  private
  def set_stop_business
    self.stop_business ||= false
  end

  def save_price_has_dropped
    self.price_has_dropped = (self.price * (100 - self.discount))/100
  end
end
