Feature:

Scenario Outline: No attributes cannot be left blank
When I go to the new message page
And I fill in "<label>" with ""
And I press "Send Message"
Then I should see a message <model> error "can't be blank"
Examples:
| label   | model   |
| Name    | name    |
| Email   | email   |
| Message | content |
