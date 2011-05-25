Feature:

Scenario: View of info page
Given an info_section exists with title: "Onagawa"
When I go to the info page
Then I should see "Onagawa" within the "submenu" section

Scenario: Links on the info page
Given an info_section exists with title: "Onagawa"
When I go to the info page
And I follow "Onagawa" within the "submenu" section

