require 'spec_helper'

describe OperatorController do

  describe "GET 'info'" do
    it "should be successful" do
      get 'info'
      response.should be_success
    end
  end

  describe "GET 'contact'" do
    it "should be successful" do
      get 'contact'
      response.should be_success
    end
  end

end
