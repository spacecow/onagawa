class ResetsController < ApplicationController
  load_and_authorize_resource

  before_filter :load_profile, :only => :new

  def new
  end

  def create
    if @reset.save
      flash[:notice] = message :reset_instructions 
      ResetMailer.reset_confirmation(@reset).deliver
      redirect_to root_path
    else
      load_profile
      render "new"
    end
  end

  private

    def load_profile; @profile = Profile.new end

end
