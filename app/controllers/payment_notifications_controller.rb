class PaymentNotificationsController < ApplicationController
  load_and_authorize_resource
  protect_from_forgery :except => :create

  def create
    PaymentNotification.create!(:params => params, :order_id => params[:invoice], :status => params[:payment_status], :transaction_id => params[:txn_id])
    render :nothing => true
  end
end

