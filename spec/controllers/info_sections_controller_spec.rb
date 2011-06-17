require File.dirname(__FILE__) + '/../spec_helper'


describe InfoSectionsController do
  controller_actions = controller_actions("info_sections")

  describe "a user is not logged in" do
    controller_actions.each do |action,req|
      if %(default).include?(action)
        it "should reach the #{action} page" do
          @info_section = Factory(:info_section)
          send("#{req}", "#{action}", :id => @info_section.id)
          response.redirect_url.should_not eq(login_url)
        end
      elsif action == "show"
        it "should reach the #{action} page if it not is marked deleted" do
          @info_section = Factory(:info_section)
          send("#{req}", "#{action}", :id => @info_section.id)
          response.redirect_url.should_not eq(login_url)
        end
        it "should not reach the #{action} page if it is marked deleted" do
          @info_section = Factory(:info_section, :deleted => 1)
          send("#{req}", "#{action}", :id => @info_section.id)
          response.redirect_url.should eq(login_url)
        end
      else
        it "should not reach the #{action} page" do
          @info_section = Factory(:info_section)
          send("#{req}", "#{action}", :id => @info_section.id)
          response.redirect_url.should eq(login_url)
        end
      end
    end
  end

  describe "an admin is logged in" do
    before(:each) do
      @user = Factory(:user, :roles_mask => 2)
      session[:user_id] = @user.id
    end
    
    controller_actions.each do |action,req|
      if %w(new create edit update destroy default).include?(action)
        it "should reach the #{action} page" do
          @info_section = Factory(:info_section)
          send("#{req}", "#{action}", :id => @info_section.id)
          response.redirect_url.should_not eq(welcome_url)
        end
      elsif action=="show"
        it "should reach the #{action} page even if it is marked deleted" do
          @info_section = Factory(:info_section, :deleted => 1)
          send("#{req}", "#{action}", :id => @info_section.id)
          response.redirect_url.should_not eq(welcome_url)
        end
      else
        it "should not reach the #{action} page" do
          @info_section = Factory(:info_section)
          send("#{req}", "#{action}", :id => @info_section.id)
          response.redirect_url.should eq(welcome_url)
        end
      end
    end    
  end
end
