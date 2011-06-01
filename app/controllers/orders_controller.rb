class OrdersController < ApplicationController
  load_and_authorize_resource

  def new
  end

  def purchase
    @order = Order.new(params[:order])
    if @order.valid?
      if params[:address_checked] == "true"
        @purchase = Purchase.new
      else
        params[:address_checked] = true
        @map_url = map_url
        render 'new'
      end
    else
      params[:address_checked] = true
      @map_url = map_url
      render 'new'
    end
  end

  def create
    @purchase = Purchase.new(params[:purchase])
    if @purchase.valid?
      if params[:prize_checked] == "true"
        render 'success'
      else
        params[:prize_checked] = true
        @order = Order.new(params[:order])
        @prize = 13 * @purchase.quantity.to_i 
        render 'purchase'
      end
    else
      params[:prize_checked] = true
      @order = Order.new(params[:order])
      @prize = 13 * @purchase.quantity.to_i 
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

  private

     def map_url
      "http://maps.google.com/maps/api/staticmap?" +
      [["size=335x130"],
       ["maptype=roadmap"],
       ["sensor=false"],
       ["center=#{@order.latitude},#{@order.longitude}"],
       ["zoom=12"],
       ["style=feature:all|element:all|saturation:-100"],
       ["markers=color:0xEE127B|#{@order.latitude},#{@order.longitude}"]].join("&")
     end
end
