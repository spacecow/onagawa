class OrdersController < ApplicationController
  load_and_authorize_resource

  def new
    @profile = Profile.new(params[:profile])
  end

  def create
    if @order.valid?
      if params[:price_checked] == "true" && params[:commit] == "Purchase"
        @profile = Profile.new(params[:profile])
        render :success 
      else
        params[:price_checked] = true
        @price = 15 * @order.quantity.to_i 
        @profile = Profile.new(params[:profile])
        render :new
      end
    else
      params[:price_checked] = true unless @order.quantity.blank?
      @price = 15 * @order.quantity.to_i 
      @profile = Profile.new(params[:profile])
      render :new
    end
  end
end
