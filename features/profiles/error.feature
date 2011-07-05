Feature:

Scenario: First name must be filled in
When I go to the new profile page
And I fill in "First name" with ""
And I press the button
Then I should see a profile first_name error "can't be blank"

Scenario: Last name must be filled in
When I go to the new profile page
And I fill in "Last name" with ""
And I press the button
Then I should see a profile last_name error "can't be blank"

Scenario Outline: Email must be valid
When I go to the new profile page
And I fill in "Email" with "<input>"
And I press the button
Then I should see a profile email error "is invalid"
Examples:
|input|
|email|
|email@address|

Scenario: Email cannot be blank
When I go to the new profile page
And I fill in "Email" with ""
And I press the button
Then I should see a profile email error "is invalid and can't be blank"

Scenario: Phone is optional
When I go to the new profile page
And I fill in "Phone" with ""
And I press the button
Then I should see no order phone error

Scenario: Address cannot be blank
When I go to the new profile page
And I fill in "Address" with ""
And I press the button
Then I should see a profile address error "can't be blank"

Scenario: City cannot be blank
When I go to the new profile page
And I fill in "City" with ""
And I press the button
Then I should see a profile city error "can't be blank"

Scenario: Zipcode cannot be blank
When I go to the new profile page
And I fill in "Postal/Zip" with ""
And I press the button
Then I should see a profile zipcode error "can't be blank"

Scenario: Country cannot be left unselected
When I go to the new profile page
And I select "" from "Country"
And I press the button
Then I should see a profile country error "can't be blank"
