class OrdersController < ApplicationController
  load_and_authorize_resource

  def new
  end

  def purchase
    @order = Order.new(params[:order])
    if @order.valid?
      @purchase = Purchase.new
    else
      render 'new'
    end
  end

  def create
    @purchase = Purchase.new(params[:purchase])
    if @purchase.save
    else
      render 'purchase'
    end
  end
    #@order = Order.new(params[:order])
    #@order.ip_address = request.remote_ip
    #if @order.save
    #  #redirect_to @order.paypal_url(@order.quantity, new_order_url, root_url)
    #  if @order.purchase
    #    render :action => "success"
    #  else
    #    render :action => "failure"
    #  end
    #else
    #  render :action => 'new'
    #end
end
