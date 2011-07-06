class ProfilesController < ApplicationController
  load_and_authorize_resource

  def new
  end

  def create
    if @profile.valid?
      if params[:price_checked] == "true"
        redirect_to new_order_path
      else
        params[:address_checked] = true
        @map_url = map_url
        render :new
      end
    else
      params[:address_checked] = true
      @map_url = map_url
      render :new
    end
  end

  def purchase
    @profile = Profile.new(params[:profile])
    if @profile.valid?
      if params[:address_checked] == "true"
        redirect_to new_order_path
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
