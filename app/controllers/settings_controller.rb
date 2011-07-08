class SettingsController < ApplicationController
  load_and_authorize_resource

  before_filter :load_profile, :only => [:show,:edit]

  def show
  end

  def edit
  end

  def update
    if @setting.update_attributes(params[:setting])
      redirect_to @setting
    else
      load_profile
      render :edit
    end
  end

  private
  
    def load_profile; @profile = Profile.new end

end
