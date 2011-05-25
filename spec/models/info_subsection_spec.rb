require File.dirname(__FILE__) + '/../spec_helper'

describe InfoSubsection do
  it "should be valid" do
    InfoSubsection.new.should be_valid
  end
end
