Feature:

Scenario: Quantity cannot be left blank
When I complete an order
And I fill in "Quantity" with ""
And I press the button
Then I should see a purchase quantity error "is not a number"

Scenario: Quantity cannot be negative
When I complete an order
And I fill in "Quantity" with "-5"
And I press the button
Then I should see a purchase quantity error "is invalid"

Scenario: Card type cannot be left unselected
When I complete an order
And I select "" from "Card type"
And I press the button
Then I should see a purchase card_type error "can't be blank"

Scenario: Card number cannot be left blank
When I complete an order
And I fill in "Card number" with ""
And I press the button
Then I should see a purchase card_number error "is required"

Scenario: Card verification cannot be left blank
When I complete an order
And I fill in "Card verification (CVV)" with ""
And I press the button
Then I should see a purchase card_verification error "is required"

Scenario: Card expires on cannot be left unselected
When I complete an order
And I select "" from "Year"
And I press the button
Then I should see a purchase card_expires_on error "expired and is not a valid year"

Scenario: Card expires on cannot be expired
When I complete an order
And I select "2011" from "Year"
And I select "1 - January" from "Month"
And I press the button
Then I should see a purchase card_expires_on error "expired"
