Feature:

Scenario: Create an order
When I complete an order
Then I should see a "new_purchase" form

#And I select "2020" from "Year"
#And I fill in "Card number" with "1"
#And I fill in "Card verification" with "123"
#And I fill in "Quantity" with "10"
#Then an order should exist with first_name: "Test", last_name: "Name", card_expires_on: "2020-01-01", ip_address: "127.0.0.1", quantity: 10
#And 1 orders should exist
#And I should see "success"

