require File.dirname(__FILE__) + '/../spec_helper'

describe InfoSection do
  it "should be valid" do
    InfoSection.new.should be_valid
  end
end
