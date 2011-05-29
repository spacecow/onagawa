Feature:
Background:
Given I am logged in as admin

Scenario: New info section view
When I go to the new info section page
Then the "Title" field should be empty
And I should see no "Content" field
And I should see no "Filename" field
But I should see no "Pos*" field
And I should see no "New Info Section" link within the "submenu" section

Scenario: Create an info section
When I go to the new info section page
And I fill in "Title" with "Onagawa"
And I press "Create Info Section"
Then an info_section should exist with title: "Onagawa"
And 1 info_sections should exist

Scenario: No subsections should be visible on the error page
When I go to the new info section page
And I press "Create Info Section"
Then I should see no "Content" field
Then I should see no "Filename" field
