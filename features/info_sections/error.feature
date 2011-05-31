Feature:
Background:
Given I am logged in as admin
And an info_section exists with title: "onagawa"

Scenario Outline: An info section's title cannot be blank
When I go to <path> page
And I fill in "Title" with ""
And I press the button 
Then I should see an info_section title error "can't be blank"
Examples:
|path|
|the new info_section|
|that info_section's edit|

Scenario Outline: An info section's title must be unique
Given an info_section exists
When I go to <path> page
And I fill in "Title" with "onagawa"
And I press the button
Then I should see an info_section title error "has already been taken"
Examples:
|path|
|the new info_section|
|that info_section's edit|

Scenario: Filename cannot be blank
Given an info_section exists
When I go to that info_section's edit page
And I fill in the first "Content" with "something"
And I fill in the first "Filename" with ""
And I press the button
Then I should see an info_section filename error "can't be blank" on the first info_subsection
