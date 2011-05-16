class OrdersController < ApplicationController
  load_and_authorize_resource

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(params[:order])
    if @order.save
      redirect_to root_url, :notice => created(:order)
    else
      render :action => 'new'
    end
  end
end
