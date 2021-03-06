class MessagesController < ApplicationController
  load_and_authorize_resource

  before_filter :load_profile, :only => [:new]

  def index
    @messages = Message.all
  end

  def show
    @message = Message.find(params[:id])
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(params[:message])
    if @message.save
      flash[:notice] = "Thank you for your message. We will reply as soon as we can." 
      redirect_to root_url
    else
      load_profile
      render :action => 'new'
    end
  end

  def destroy
    @message = Message.find(params[:id])
    @message.destroy
    redirect_to messages_url, :notice => deleted(:message)
  end

  private

    def load_profile; @profile = Profile.new end

end
