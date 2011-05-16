require File.dirname(__FILE__) + '/../spec_helper'

def controller_actions(controller)
  Rails.application.routes.routes.inject({}) do |hash, route|
    hash[route.requirements[:action]] = route.verb.downcase if route.requirements[:controller] == controller && !route.verb.nil?
    hash
  end
end

describe PaymentNotificationsController do
  payment_notifications_controller_actions = controller_actions("payment_notifications")

  before(:each) do
    @payment_notification = Factory(:payment_notification)
  end

  describe "a user is not logged in" do
    payment_notifications_controller_actions.each do |action,req|
      if %w().include?(action)
        it "should reach the #{action} page" do
          send("#{req}", "#{action}", :id => @payment_notification.id)
          response.redirect_url.should_not eq(login_url)
        end
      else
        it "should not reach the #{action} page" do
          send("#{req}", "#{action}", :id => @payment_notification.id)
          response.redirect_url.should eq(login_url)
        end
      end
    end
  end

  describe "a member is logged in" do
    before(:each) do
      user = Factory(:user, :roles_mask=>8)
      @own_payment_notification = Factory(:payment_notification, :user_id => user.id )
      session[:user_id] = user.id
    end
    
    payment_notifications_controller_actions.each do |action,req|
      if %w().include?(action)
        it "should reach the #{action} page" do
          send("#{req}", "#{action}", :id => @payment_notification.id)
          response.redirect_url.should_not eq(welcome_url)
        end
      elsif %w().include?(action)
        it "should reach his own #{action} page" do
          send("#{req}", "#{action}", :id => @own_payment_notification.id)
          response.redirect_url.should_not eq(root_url)
        end
        it "should not reach other's #{action} page" do
          send("#{req}", "#{action}", :id => @payment_notification.id)
          response.redirect_url.should eq(root_url)
        end
      else
        it "should not reach the #{action} page" do
          send("#{req}", "#{action}", :id => @payment_notification.id)
          response.redirect_url.should eq(welcome_url)
        end
      end
    end    
  end

  describe "a mini-admin is logged in" do
    before(:each) do
      session[:user_id] = Factory(:user, :roles_mask=>4).id
    end
    
    payment_notifications_controller_actions.each do |action,req|
      if %w().include?(action)
        it "should reach the #{action} page" do
          send("#{req}", "#{action}", :id => @payment_notification.id)
          response.redirect_url.should_not eq(welcome_url)
        end
      else
        it "should not reach the #{action} page" do
          send("#{req}", "#{action}", :id => @payment_notification.id)
          response.redirect_url.should eq(welcome_url)
        end
      end
    end    
  end  

  describe "an admin is logged in" do
    before(:each) do
      session[:user_id] = Factory(:user, :roles_mask=>2).id
    end
    
    payment_notifications_controller_actions.each do |action,req|
      if %w().include?(action)
        it "should reach the #{action} page" do
          send("#{req}", "#{action}", :id => @payment_notification.id)
          response.redirect_url.should_not eq(root_url)
        end
      else
        it "should not reach the #{action} page" do
          send("#{req}", "#{action}", :id => @payment_notification.id)
        response.redirect_url.should eq(root_url)
      end
    end    
  end

  describe "a god has come down to Earth" do
    before(:each) do
      session[:user_id] = Factory(:user, :roles_mask=>1).id
    end
    
    payment_notifications_controller_actions.each do |action,req|
      it "should reach the #{action} page" do
        send("#{req}", "#{action}", :id => @payment_notification.id)
        response.redirect_url.should_not eq(welcome_url)
      end
    end    
  end  
end
