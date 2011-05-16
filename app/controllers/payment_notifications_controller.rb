class PaymentNotificationsController < ApplicationController
  protect_from_forgery :except => :create

  def create
    p "111111111111111111111111111111111111"
    PaymentNotification.create!(:params => params, :order_id => params[:invoice], :status => params[:payment_status], :transaction_id => params[:txn_id])
    render :nothing => true
  end
end



