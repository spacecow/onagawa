Feature:

Scenario: Create a new message
When I go to the new message page
And I fill in "Name" with "Test Name"
And I fill in "Email*" with "test@example.com"
And I fill in "Message" with "A new message for you."
And I press "Send Message"
Then a message should exist with name: "Test Name", email: "test@example.com", content: "A new message for you."
And 1 messages should exist
And I should see "Thank you for your message. We will reply as soon as we can." as notice flash message
And I should be on the new profile page
#And an email should be delivered to "jsveholm@gmail.com"
