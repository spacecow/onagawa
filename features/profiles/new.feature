Feature:

Scenario: A map should be shown on the error page
When I go to the new profile page
And I press "Continue to Purchase"
Then I should see an image within the "new_profile" form

Scenario: A map should be shown once even if everything is filled out correctly
When I complete a profile
Then I should see a "new_profile" form
And I should see an image within the "new_profile" form
And 0 profiles should exist
And I should see no notice flash message

Scenario: After getting an error once, if fields are filled in correctly, sign up
When I go to the new profile page
And I fill in "First name" with "Test"
And I fill in "Last name" with "Name"
And I fill in "Email" with "test@example.com"
And I fill in "Address" with "Test Street 12"
And I fill in "City" with "Test Town"
And I fill in "Postal/Zip" with "2345 Town"
And I press "Continue to Purchase"
And I select "Canada" from "Country"
And I press "Continue to Purchase"
Then I should see a "new_order" form
