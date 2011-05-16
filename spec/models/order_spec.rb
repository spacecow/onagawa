require File.dirname(__FILE__) + '/../spec_helper'

describe Order do
  it "should be valid" do
    Order.new.should be_valid
  end
end

# == Schema Information
#
# Table name: orders
#
#  id              :integer(4)      not null, primary key
#  cart_id         :integer(4)
#  ip_address      :string(255)
#  first_name      :string(255)
#  last_name       :string(255)
#  card_type       :string(255)
#  card_expires_on :date
#  created_at      :datetime
#  updated_at      :datetime
#

