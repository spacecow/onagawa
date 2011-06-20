Feature:

Scenario: Static links
When I go to the root page
And I follow "Contact"
Then I should be on the new message page
And the menu "Contact" should be active

Scenario: The New Info Section should not be shown on other sections
Given I am logged in as admin
When I go to the root page
And I follow "Contact"
And I should see no "New Info Section" link within the "submenu" section

Scenario: Submenu links are shown if it is the default
Given an info_section exists with title: "Onagawa"
And I go to the root page
Then I should see "Onagawa" within the "submenu" section

Scenario Outline: Info link
Given an info_section: "onagawa" exists with title: "Onagawa"
And an info_section: "ishinomaki" exists with title: "Ishinomaki"
When I go to the root page
And I follow "Info" within the "menu" section
And I follow "<link>" within the "submenu" section
Then I should be on the info_section: "<path>" page
And the submenu "<link>" should be active
And the submenu "<other_link>" should be inactive
Examples:
| link       | path       | other_link |
| Onagawa    | onagawa    | Ishinomaki |
| Ishinomaki | ishinomaki | Onagawa    |

Scenario: The default info section is the one with lowest position
Given an info_section: "2" exists with pos: 2
And an info_section: "1" exists with pos: 1
When I go to the root page
And I follow "Info"
Then I should be on the info_section: "1" page

Scenario: Default Info for non-admin is same place if there are none
When I go to the root page
And I follow "Info" within the "menu" section
Then I should be on the new order page

Scenario: Default Info for admin is New Info if there are none
Given I am logged in as admin
When I go to the root page
And I follow "Info" within the "menu" section
Then I should be on the new info_section page

Scenario: Admin can reach the new info section from the root page
Given I am logged in as admin
And an info_section exists
When I go to the root page
And I follow "Info" within the "menu" section
And I follow "New Info Section" within the "submenu" section
Then I should be on the new info_section page

@language
Scenario: Switch to Japanese
When I go to the root page
When I follow "日本語" within the "user_nav" section
Then I should see "情報" within the "menu" section
And I should see "English" within the "user_nav" section

Scenario: Deleted Info Sections are not displayed in the menu
Given an info_section exists with marked_deleted: 1, title: "Onagawa"
When I go to the root page
And I follow "Info" within the "menu" section
Then I should not see "Onagawa" within the "submenu" section 
