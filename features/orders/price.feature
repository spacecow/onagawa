Feature:
Background:
When I complete a profile
And I press "Continue to Purchase"

Scenario: The price is calculated when order is filled out but price is not confirmed
When I complete an order
Then I should see "Your order will cost: 150 USD" within the "price" section

Scenario Outline: Calculate the price
When I fill in "Quantity" with "10"
And I press "<lbl>"
Then I should see "Your order will cost: 150 USD" within the "price" section
Examples:
| lbl             |
| Calculate Price |
| Purchase        |
