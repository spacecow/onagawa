Feature:
Background:
Given an info_section exists with title: "Onagawa"
And I am logged in as admin

Scenario: Info Subsection Index view
Given an info_subsection exists with info_section: that info_section, content: "Onagawa was a beautiful city.", filename: "Onagawa1"
When I go to that info_section's info_subsections page
Then I should see "Onagawa was a beautiful city." within the first "subsections" listing
And I should see an "Onagawa1thumb" image within the first "subsections" listing 
And the submenu "Onagawa" should be active

Scenario: Position arrows on subsections 
Given 3 info_subsections exist with info_section: that info_section
When I go to that info_section's info_subsections page
Then I should see "▼" but not "▲" within the first "subsections" listing
And I should see "▼" and "▲" within the second "subsections" listing
And I should see "▲" but not "▼" within the third "subsections" listing

@pos
Scenario Outline: Change pos
Given info_subsection exist with info_section: that info_section, content: "first", filename: "Onagawa1"
Given info_subsection exist with info_section: that info_section, content: "second", filename: "Onagawa2"
When I go to that info_section's info_subsections page
And I follow "<link>" within the <order> "subsections" listing
Then I should see "second" within the first "subsections" listing
And I should see an "Onagawa2thumb" image within the first "subsections" listing
And I should see "first" within the second "subsections" listing
And I should see an "Onagawa1thumb" image within the second "subsections" listing
Examples:
| link | order  |
| ▼    | first  |
| ▲    | second |

Scenario: Links for admin
Given I am logged in as admin
When I go to that info_section's info_subsections page
Then I should see links "Edit Info Section, Delete Info Section" at the bottom of the page

Scenario: Deleted Info Section are not to be visible in the menu
Given an info_section exists with title: "Ishinomaki", deleted: true
When I go to that info_section's info_subsections page
Then I should not see "Ishinomaki" within the "submenu" section 
