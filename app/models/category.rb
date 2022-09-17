class Category < ApplicationRecord
    has_many :subordinates, class_name: 'Category', foreign_key: :category_id, dependent: :delete_all
    belongs_to :category, class_name: 'Category', optional: true
    has_many :products, dependent: :delete_all

    validates :name, presence: true, uniqueness: true

    scope :category_parents, -> { where(role: true) }
    scope :category_childs, -> { where(role: false) }
end
