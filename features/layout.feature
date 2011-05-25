Feature:

Scenario: Static links
When I go to the root page
And I follow "Contact"
Then I should be on the new message page

@info
Scenario: Info link
Given an info_section exists
When I go to the root page
And I follow "Info"
Then I should be on that info_section page
