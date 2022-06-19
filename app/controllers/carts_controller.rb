class CartsController < ApplicationController
  def index
    @order = current_order
    @order_items = @order.orderitems
    @products = @order_items.map(&:product)
    # prodcuts_hash = @products.pluck(:id, :price, :discount).map{ |id, price, discount| [id, price - price * discount / 100] }
    # @total_price = prodcuts_hash.map{ |id, price| @order_items.find_by(product_id: id).quantity * price }.sum.to_i
  end

end