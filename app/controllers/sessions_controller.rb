class SessionsController < ApplicationController
  def new
    load_profile
  end

  def create
    user = User.authenticate(params[:login], params[:password])
    if user
      session[:user_id] = user.id
      redirect_to_target_or_default root_url, :notice => t('success.logged_in')
    else
      load_profile
      flash.now[:alert] = t('alert.invalid_login_or_password')
      render :action => 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => t('success.logged_out')
  end

  private

    def load_profile; @profile = Profile.new end

end
