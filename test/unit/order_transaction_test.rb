def setup
  @amount = 100
end

def test_successful_authorization
  auth = OrderTransaction.authorize(@amount,credit_card(:number => '1'))
  assert auth.success
end
