class Promotion < ApplicationRecord

    validates :Title, :Code, :Discount_percent, :Discount_price, :Discount_type, presence: true
    validates :Min_order_value, :Max_order_value, :Start_date, :End_date, :Number_of_use, presence: true

end
