Feature:

Scenario: A map should be shown on the error page
When I go to the new order page
And I press "Continue to Purchase"
Then I should see an image within the "new_order" form

Scenario: A map should be shown once even if everything is filled out correctly
When I complete an order
Then I should see a "new_order" form
And I should see an image within the "new_order" form
And 0 orders should exist
And I should see no notice flash message

Scenario: After getting an error once, if fields are filled in correctly, sign up
When I go to the new order page
And I fill in "First name" with "Test"
And I fill in "Last name" with "Name"
And I fill in "Email" with "test@example.com"
And I fill in "Address" with "Test Street 12"
And I fill in "City" with "Test Town"
And I fill in "Postal/Zip" with "2345 Town"
And I press "Continue to Purchase"
And I select "Canada" from "Country"
And I press "Continue to Purchase"
Then I should see a "new_purchase" form

Scenario: Signing up
When I complete an order
And I press "Continue to Purchase"
Then I should see a "new_purchase" form

#And I select "2020" from "Year"
##And I fill in "Card number" with "1"
##And I fill in "Card verification" with "123"
##And I fill in "Quantity" with "10"
##Then an order should exist with first_name: "Test", last_name: "Name", card_expires_on: "2020-01-01", ip_address: "127.0.0.1", quantity: 10
##And 1 orders should exist
##And I should see "success"
#
