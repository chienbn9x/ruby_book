class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, :password, :fullName, :Blocked, presence: true
  validates :email, uniqueness: true

  has_many :orders, dependent: :delete_all
  has_many :addresses, dependent: :delete_all
  has_many :reviews, dependent: :delete_all
  has_many :sub_reviews, dependent: :delete_all
end
