Feature:

Scenario: View of info page
Given an info_section exists with title: "Onagawa"
When I go to the info page
Then I should see "Onagawa" within the "submenu" section

Scenario: Links on the info page
Given an info_section exists with title: "Onagawa", pos: 1
When I go to the info page
And I follow "Onagawa" within the "submenu" section
Then I should be on that info_section page

Scenario: Info sections are listed in order
Given an info_section exists with title: "Ishinomaki", pos: 2
And an info_section exists with title: "Onagawa", pos: 1
When I go to the info page
Then I should see "Onagawa" within the first "submenu" listing
And I should see "Ishinomaki" within the second "submenu" listing

Scenario: Image shown depends on the info section
Given an info_section exists with title: "Onagawa"
And an info_subsection exists with info_section: that info_section, pos: 1
When I go to that info_section page
#Then show me the page
Then I should see a "Onagawa1" image
