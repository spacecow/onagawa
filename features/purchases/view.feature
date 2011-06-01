Feature:

Scenario: Purchase form view
When I complete an order
And I press "Continue to Purchase"
Then I should see no "new_order" form
But I should see a "new_purchase" form
And the "Quantity" field should be empty
But the "Quattity" hint should say "13 USD/piece"
And nothing should be selected in the "Card type" field
And the "Card number" field should be empty
And the "Card verification (CVV)" field should be empty
And nothing should be selected in the "Year" field
And I should see a "Purchase" button
And I should see a "Calculate Prize" button

Scenario: Cannot complete a purchase with the calculate button
