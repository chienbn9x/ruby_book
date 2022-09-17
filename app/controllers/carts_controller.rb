class CartsController < ApplicationController
  def index
    @order = current_order
    @order_items = @order.orderitems
    @products = @order_items.map(&:product)
  end

end