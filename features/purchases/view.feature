Feature:

Scenario: Purchase form view
When I complete an order
And I press "Continue to Purchase"
Then I should see no "new_order" form
But the "Quantity" field should be empty
And nothing should be selected in the "Card type" field
And the "Card number" field should be empty
And the "Card verification (CVV)" field should be empty
And nothing should be selected in the "Year" field
And I should see a "Purchase" button

Scenario: Order listing
When I complete an order
And I press "Continue to Purchase"
Then I should see "First name Test
 # And %(I fill in "Last name" with "Name")
 # And %(I fill in "Email" with "test@example.com")
 # And %(I fill in "Address" with "Test Street 12")
 # And %(I fill in "City" with "Test Town")
 # And %(I fill in "Postal/Zip" with "2345 Town")
 # And %(I select "Canada" from "Country")
 # And %(I press "Continue to Purchase")
