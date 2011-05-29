Feature:

Scenario: Purchase form view
When I complete an order
Then I should see no "new_order" form
But the "Quantity" field should be empty
And nothing should be selected in the "Card type" field
And the "Card number" field should be empty
And the "Card verification (CVV)" field should be empty
And nothing should be selected in the "Year" field
And I should see a "Purchase" button
