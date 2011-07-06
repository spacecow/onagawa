require File.dirname(__FILE__) + '/../../test_helper'

class OrderIntegrationTest < ActiveRecord::TestCase
  fixtures :orders

  def setup
    @order = orders(:pending)
    @credit_card = credit_card(:number => '4111111111111111')
    @options = { :description => 'A store purchase',
                 :billing_address => address }
  end

  def test_successful_order_authorization
    authorization = @order.authorize_payment(@credit_card,@options)
    assert_equal authorization.reference, @order.authorization_reference
  end
end
