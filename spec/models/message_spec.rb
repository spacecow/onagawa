require File.dirname(__FILE__) + '/../spec_helper'

describe Message do
  it "should be valid" do
    Message.new.should be_valid
  end
end

# == Schema Information
#
# Table name: messages
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  email      :string(255)
#  content    :text
#  created_at :datetime
#  updated_at :datetime
#

