Feature:

Scenario: First name must be filled in
When I go to the new order page
And I fill in "First name" with ""
And I press the button
Then I should see an order first_name error "can't be blank"

Scenario: Last name must be filled in
When I go to the new order page
And I fill in "Last name" with ""
And I press the button
Then I should see an order last_name error "can't be blank"

Scenario Outline: Email must be valid
When I go to the new order page
And I fill in "Email" with "<input>"
And I press the button
Then I should see an order email error "is invalid"
Examples:
|input|
|email|
|email@address|

Scenario: Email cannot be blank
When I go to the new order page
And I fill in "Email" with ""
And I press the button
Then I should see an order email error "is invalid and can't be blank"

Scenario: Phone is optional
When I go to the new order page
And I fill in "Phone" with ""
And I press the button
Then I should see no order phone error

Scenario: Address cannot be blank
When I go to the new order page
And I fill in "Address" with ""
And I press the button
Then I should see an order address error "can't be blank"

Scenario: City cannot be blank
When I go to the new order page
And I fill in "City" with ""
And I press the button
Then I should see an order city error "can't be blank"

Scenario: Zipcode cannot be blank
When I go to the new order page
And I fill in "Postal/Zip" with ""
And I press the button
Then I should see an order zipcode error "can't be blank"

Scenario: Country cannot be left unselected
When I go to the new order page
And I select "" from "Country"
And I press the button
Then I should see an order country error "can't be blank"
