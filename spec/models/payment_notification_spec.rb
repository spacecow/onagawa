require File.dirname(__FILE__) + '/../spec_helper'

describe PaymentNotification do
  it "should be valid" do
    PaymentNotification.new.should be_valid
  end
end

# == Schema Information
#
# Table name: payment_notifications
#
#  id             :integer(4)      not null, primary key
#  params         :text
#  order_id       :integer(4)
#  status         :string(255)
#  transaction_id :string(255)
#  created_at     :datetime
#  updated_at     :datetime
#

