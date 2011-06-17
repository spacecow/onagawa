class SettingsController < ApplicationController
  load_and_authorize_resource

  def show
  end

  def edit
  end

  def update
    if @setting.update_attributes(params[:setting])
      redirect_to @setting
    else
      render :edit
    end
  end

end