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
Then I should see "First name Test"
And I should see "Last name Name"
And I should see "Email test@example.com"
And I should see "Address Test Street 12, Test Town, 2345 Canada"
