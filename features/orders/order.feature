Feature:

Scenario: Order listing
When I complete a profile
And I press "Continue to Purchase"
Then I should see "First name Test" within the "main" section
And I should see "Last name Name" within the "main" section
And I should see "Email test@example.com" within the "main" section
And I should see "Phone 123456" within the "main" section
And I should see "Address Test Street 12, Test Town, 2345 Canada" within the "main" section

Scenario: The order listing stays on the error page
When I complete a profile
And I press "Continue to Purchase"
And I press "Purchase"
Then I should see "First name Test" within the "main" section
And I should see "Last name Name" within the "main" section
And I should see "Email test@example.com" within the "main" section
And I should see "Phone 123456" within the "main" section
And I should see "Address Test Street 12, Test Town, 2345 Canada" within the "main" section

Scenario: The order listing stays when order is filled out but prize is not confirmed
When I complete a profile
And I press "Continue to Purchase"
And I complete an order
Then I should see "First name Test" within the "main" section
And I should see "Last name Name" within the "main" section
And I should see "Email test@example.com" within the "main" section
And I should see "Phone 123456" within the "main" section
And I should see "Address Test Street 12, Test Town, 2345 Canada" within the "main" section
