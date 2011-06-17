Feature:

Scenario: Mark an info section as deleted
Given an info_section exists with title: "Onagawa"
And I am logged in as admin
When I go to that info_section page
And I follow "Delete Info Section"
Then an info_section should exist with title: "Onagawa", marked_deleted: true
And 1 info_sections should exist
And I should be on the new info_section page

Scenario: Redirection after deletion cannot go back to the one marked deleted
Given an info_section: "onagawa" exists with title: "Onagawa"
And an info_section: "ishinomaki" exists with title: "Ishinomaki"
And I am logged in as admin
When I go to info_section: "onagawa" page
And I follow "Delete Info Section"
Then an info_section should exist with title: "Onagawa", marked_deleted: true
And an info_section should exist with title: "Ishinomaki", marked_deleted: false
And 2 info_sections should exist
And I should be on info_section: "ishinomaki" page 
