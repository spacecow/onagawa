Feature:

Scenario: Static links
When I go to the root page
And I follow "Contact"
Then I should be on the new message page

Scenario: Submenu links are not shown unless the Info menu is activated
Given an info_section exists with title: "Onagawa"
And I go to the root page
Then I should see no "submenu" section

Scenario Outline: Info link
Given an info_section: "onagawa" exists with title: "Onagawa"
And an info_section: "ishinomaki" exists with title: "Ishinomaki"
When I go to the root page
And I follow "Info" within the "menu" section
And I follow "<link>" within the "submenu" section
Then I should be on the info_section: "<path>" page
Examples:
|link|path|
|Onagawa|onagawa|
|Ishinomaki|ishinomaki|

Scenario: The default info section is the one with lowest position
Given an info_section: "2" exists with pos: 2
And an info_section: "1" exists with pos: 1
When I go to the root page
And I follow "Info"
Then I should be on the info_section: "1" page

