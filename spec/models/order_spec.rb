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
#  id           :integer(4)      not null, primary key
#  quantity     :integer(4)
#  purchased_at :datetime
#  created_at   :datetime
#  updated_at   :datetime
#

