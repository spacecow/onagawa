class OrdersController < ApplicationController
  load_and_authorize_resource

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(params[:order])
    @order.ip_address = request.remote_ip
    if @order.save
      #redirect_to @order.paypal_url(@order.quantity, new_order_url, root_url)
      if @order.purchase
        render :action => "success"
      else
        render :action => "failure"
      end
    else
      render :action => 'new'
    end
  end
end
