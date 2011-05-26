Feature:
Background:
Given I am logged in as admin

Scenario: New info section view
When I go to the new info section page
Then the "Title" field should be empty
And the first through fourth "Content" fields should be empty
And the first through fourth "Filename" fields should be empty
But I should see no "Pos" field
And I should see no fifth "Content" field
And I should see no fifth "Filename" field
And I should see no "New Info Section" link within the "submenu" section

Scenario: Create an info subsection
When I go to the new info section page
And I fill in "Title" with "Onagawa"
And I fill in the first "Content" with "Onagawa was a beautiful little city."
And I press "Create Info Section"
Then an info_section should exist with title: "Onagawa"
And 1 info_sections should exist
And an info_subsection should exist with content: "Onagawa was a beautiful little city.", info_section: that info_section, pos: 1
And 1 info_subsections should exist

Scenario: 4 Info subsections should be visible on the error page
When I go to the new info section page
And I press "Create Info Section"
Then I should see a first through fourth "Content" field
