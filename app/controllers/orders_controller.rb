class OrdersController < ApplicationController
  def create
    @order = current_order

    @order_item = @order.orderitems.new(order_item_params)
    @order.orderstatus_id = 1
    if @order.save
      session[:order_id] = @order.save
    end

    respond_to do |format|
      format.js {}
    end
  end

  def destroy
  end

  private
  def order_item_params
    params.require(:order).permit(:quantity, :product_id)
  end
end