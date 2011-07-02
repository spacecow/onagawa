Feature:
Background:
When I complete an order
And I press "Continue to Purchase"

Scenario: The prize is calculated when order is filled out but prize is not confirmed
When I complete a purchase
Then I should see "Your order will cost: 150 USD" within the "prize" section

Scenario Outline: Calculate the prize
When I fill in "Quantity" with "10"
And I press "<lbl>"
Then I should see "Your order will cost: 150 USD" within the "prize" section
Examples:
| lbl             |
| Calculate Price |
| Purchase        |
