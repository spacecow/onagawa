Feature:
Background:
Given I am logged in as admin

Scenario: New info section view
When I go to the new info section page
Then the "Title" field should be empty
And I should see no "Pos" field

Scenario: If the info section is the first one created, pos should be set to 1
When I go to the new info_section page
And I fill in "Title" with "Onagawa"
And I press "Create Info Section"
Then an info_section should exist with pos: 1, title: "Onagawa"

Scenario Outline: A second info section should have pos set to the previous +1
Given an info_section exists with pos: <no>
When I go to the new info_section page
And I fill in "Title" with "Onagawa"
And I press "Create Info Section"
Then an info_section should exist with pos: <no>
And an info_section should exist with pos: <no2>
And 2 info_sections should exist
Examples:
|no|no2|
|1|2|
|2|3|
