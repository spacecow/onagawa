require File.dirname(__FILE__) + '/../test_helper'
#require 'test/unit'

class OrderTransactionTest < Test::Unit::TestCase
  def test_successful_authorization
    auth = OrderTransaction.authorize(@amount,credit_card(:number=>'1'))
  end
end
