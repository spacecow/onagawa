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
#  id         :integer(4)      not null, primary key
#  ip_address :string(255)
#  first_name :string(255)
#  last_name  :string(255)
#  created_at :datetime
#  updated_at :datetime
#  country    :string(255)
#  city       :string(255)
#  address    :string(255)
#  zipcode    :string(255)
#  email      :string(255)
#  phone      :string(255)
#  latitude   :float
#  longitude  :float
#

