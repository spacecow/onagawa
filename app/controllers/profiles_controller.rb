class ProfilesController < ApplicationController
  load_and_authorize_resource

  def new
  end

  def purchase
    @profile = Profile.new(params[:profile])
    if @profile.valid?
      if params[:address_checked] == "true"
        @order = Order.new
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
    #@profile = Order.new(params[:profile])
    #@profile.ip_address = request.remote_ip
    #if @profile.save
    #  #redirect_to @profile.paypal_url(@profile.quantity, new_profile_url, root_url)
    #  if @profile.purchase
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
       ["center=#{@profile.latitude},#{@profile.longitude}"],
       ["zoom=12"],
       ["style=feature:all|element:all|saturation:-100"],
       ["markers=color:0xEE127B|#{@profile.latitude},#{@profile.longitude}"]].join("&")
     end
end
