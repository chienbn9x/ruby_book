class Product < ApplicationRecord

  validates :title, :publication_year, :publication_company, :authors, :description, :price, presence: true
  validates :height, :width, :weight, :layout, :number_page, presence: true

  belongs_to :category
  has_many_attached :images, dependent: :delete_all
  has_many :orderitems, dependent: :delete_all
  has_many :reviews, dependent: :delete_all

  before_save :set_stop_business

  private
  def set_stop_business
    self.stop_business ||= false
  end
end
