Feature:
Background:
Given a setting exists with contact_info: "Please give us a call."
And I am logged in as admin

Scenario: Edit Setting
When I go to that setting's edit page
And I fill in "Contact Info" with "Please send us an email instead."
And I press "Update"
Then a setting should exist with contact_info: "Please send us an email instead."
