require File.dirname(__FILE__) + '/../spec_helper'

describe InfoSection do
  it "should be valid" do
    InfoSection.new.should be_valid
  end
end

# == Schema Information
#
# Table name: info_sections
#
#  id         :integer(4)      not null, primary key
#  title      :string(255)
#  pos        :integer(4)
#  created_at :datetime
#  updated_at :datetime
#

