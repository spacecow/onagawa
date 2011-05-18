Feature:

Scenario: First or last name cannot be left blank 
When I go to the new order page
And I press "Purchase"
Then I should see an order first_name error "cannot be empty"
And I should see an order last_name error "cannot be empty"

Scenario: Year must be set
When I go to the new order page
And I press "Purchase"
Then I should see an order card_expires_on error "expired and is not a valid year"

Scenario: Card number must be set
When I go to the new order page
And I press "Purchase"
Then I should see an order card_number error "is required"

Scenario: Verification number must be set
When I go to the new order page
And I press "Purchase"
Then I should see an order card_verification error "is required"

Scenario: Quantity must be set
When I go to the new order page
And I press "Purchase"
Then I should see an order quantity error "is not a number"

Scenario: Quantity cannot be negative
When I go to the new order page
And I fill in "Quantity" with "-5"
And I press "Purchase"
Then I should see an order quantity error "is invalid"
