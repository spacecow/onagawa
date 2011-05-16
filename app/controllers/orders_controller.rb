class OrdersController < ApplicationController
  load_and_authorize_resource

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(params[:order])
    p @order
    if @order.save
      redirect_to @order.paypal_url(@order.quantity, new_order_url, payment_notifications_url)
    else
      render :action => 'new'
    end
  end
end
