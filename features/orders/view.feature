Feature:

Scenario: Purchase form view
When I complete a profile
And I press "Continue to Purchase"
Then I should see no "new_profile" form
But I should see a "new_order" form
And the "Quantity" field should be empty
But the "Quantity" hint should say "15 USD/piece"
And nothing should be selected in the "Card type" field
And the "Card number" field should be empty
And the "Card verification (CVV)" field should be empty
And nothing should be selected in the "Year" field
And I should see a "Purchase" button
And I should see a "Calculate Price" button
