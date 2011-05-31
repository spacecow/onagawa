Feature:

Scenario: Order form view
When I go to the new order page
Then I should see a "new_order" form
And the "First name" field should be empty
And the "Last name" field should be empty
And the "Email" field should be empty
And the "Phone" field should be empty
And the "Address" field should be empty
And the "City" field should be empty
And the "Postal/Zip" field should be empty
And nothing should be selected in the "Country" field
And I should see no image within the "new_order" form
But I should see no "Year" field
And I should see no "Card number" field
And I should see no "Card verification" field
And I should see no "Quantity" field
And I should see no "Card type" field
