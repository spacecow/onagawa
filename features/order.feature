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

@create
Scenario: Create an order
When I go to the new order page
And I fill in "First name" with "Test"
And I fill in "Last name" with "Name"
And I select "2020" from "Year"
And I fill in "Card number" with "1"
And I fill in "Card verification" with "123"
And I fill in "Quantity" with "10"
And I press "Purchase"
Then an order should exist with first_name: "Test", last_name: "Name", card_expires_on: "2020-01-01", ip_address: "127.0.0.1", quantity: 10
And 1 orders should exist
And I should see "success"
