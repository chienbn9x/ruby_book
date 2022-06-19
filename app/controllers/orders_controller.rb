class OrdersController < ApplicationController
  def create
    @order = current_order

    @order_item = @order.orderitems.find_by(product_id: order_item_params[:product_id])
    if @order_item.nil?
      @order_item = @order.orderitems.new(order_item_params)
    else
      quantity = @order_item.quantity + order_item_params[:quantity].to_f
      @order_item.update(quantity: quantity)
    end
    @order.sub_total = 0 if @order.sub_total.nil?
    total_price = @order.sub_total + get_final_price(order_item_params[:product_id]) * order_item_params[:quantity].to_f
    @order.sub_total = total_price
    @order.orderstatus_id = 1
    if @order.save
      session[:order_id] = @order.id
    end

    respond_to do |format|
      format.js {}
    end
  end

  def destroy
  end

  def dec
    @order = current_order
    @order_item = @order.orderitems.find_by(product_id: params[:product_id])
    quantity = @order_item.quantity - 1
    check = false
    if quantity < 1
        quantity = 1
        check = true
    end
    @order_item.update(quantity: quantity)
    if !check
      total_price = @order.sub_total - get_final_price(params[:product_id])
      @order.update(sub_total: total_price)
    end
  end

  def inc
    @order = current_order
    @order_item = @order.orderitems.find_by(product_id: params[:product_id])
    quantity = @order_item.quantity + 1
    @order_item.update(quantity: quantity)
    total_price = @order.sub_total + get_final_price(params[:product_id])
    @order.update(sub_total: total_price)
  end

  private
  def order_item_params
    params.require(:order).permit(:quantity, :product_id)
  end

  def get_final_price(product_id)
    product = Product.find(product_id)
    final_price = product.price * (100 - product.discount) / 100

    final_price
  end
end