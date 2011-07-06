class OrdersController < ApplicationController
  def new
  end

  def create
    @order = Order.new(params[:order])
    if @order.valid?
      if params[:price_checked] == "true" && params[:commit] == "Purchase"
        @order.save
        #order = @order.purchase
        #if order
          render :action => "success"
        #else
        #  render :action => "failure"
        #end
      else
        params[:price_checked] = true
        @profile = Profile.new(params[:profile])
        @price = 15 * @order.quantity.to_i 
        render 'purchase'
      end
    else
      params[:price_checked] = true unless @order.quantity.blank?
      @profile = Profile.new(params[:profile])
      @price = 15 * @order.quantity.to_i 
      render 'purchase'
    end
  end
end
