Feature:

@no_errors
Scenario: Complete a purchase without errors
Given I complete an order
And I press "Continue to Purchase"
And I complete a purchase
And I press "Purchase"
Then I should see "success" within the "main" section

Scenario: Complete a purchase with some errors with check of prize
Given I complete an order
And I press "Continue to Purchase"
And I fill in "Quantity" with "10"
And I select "Visa" from "Card type"
And I fill in "Card number" with "4111111111111111"
And I fill in "Card verification (CVV)" with "123"
And I press "Purchase"
And I select "2015" from "Year"
And I press "Purchase"
Then I should see "success" within the "main" section

Scenario: Complete (not) a purchase with some errors without check of prize
Given I complete an order
And I press "Continue to Purchase"
And I select "Visa" from "Card type"
And I fill in "Card number" with "4111111111111111"
And I fill in "Card verification (CVV)" with "123"
And I select "2015" from "Year"
And I press "Purchase"
And I fill in "Quantity" with "10"
And I press "Purchase"
Then I should see "Your order will cost: 150 USD" within the "prize" section

Scenario: Cannot complete a purchase with the calculate button
Given I complete an order
And I press "Continue to Purchase"
And I complete a purchase
And I press "Calculate Price"
Then I should see "Your order will cost: 150 USD" within the "prize" section
