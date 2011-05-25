Feature:

Scenario: View of info page
Given an info_section exists with title: "Onagawa"
When I go to the info page
Then I should see "Onagawa" within the "submenu" section

Scenario: Links on the info page
Given an info_section exists with title: "Onagawa"
When I go to the info page
And I follow "Onagawa" within the "submenu" section
Then I should be on that info_section page

Scenario: Info sections are listed in order
Given an info_section exists with title: "Inshinomaki", pos: 2
And an info_section exists with title: "Onagawa", pos: 1
When I go to the info page
Then I should see "Onagawa" within the first "submenu" listing
