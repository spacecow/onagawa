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
And I should see a "Calculate Prize" button

Scenario: Order listing
When I complete an order
And I press "Continue to Purchase"
Then I should see "First name Test" within the "main" section
And I should see "Last name Name" within the "main" section
And I should see "Email test@example.com" within the "main" section
And I should see "Address Test Street 12, Test Town, 2345 Canada" within the "main" section

#Scenario: The order listing stays on the error page
#When I complete an order
#And I press "Continue to Purchase"
#And I press "Purchase"
#Then I should see "First name Test" within the "main" section
#And I should see "Last name Name" within the "main" section
#And I should see "Email test@example.com" within the "main" section
#And I should see "Address Test Street 12, Test Town, 2345 Canada" within the "main" section
