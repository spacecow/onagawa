Feature:
Background:
Given an info_section exists with title: "Mitos"
And I am logged in as admin

Scenario: Info Subsection Index view
Given an info_subsection exists with info_section: that info_section, filename: "Mitos1", pos: 1
And a pair exists with locale: "en", key: "mitos1_content_key", value: "Mitos was a beautiful city."
When I go to that info_section's info_subsections page
Then I should see "Mitos was a beautiful city." within the first "subsections" listing
And I should see an "Mitos1thumb" image within the first "subsections" listing 
And the submenu "Mitos" should be active

Scenario: Position arrows on subsections 
Given 3 info_subsections exist with info_section: that info_section
When I go to that info_section's info_subsections page
Then I should see "▼" but not "▲" within the first "subsections" listing
And I should see "▼" and "▲" within the second "subsections" listing
And I should see "▲" but not "▼" within the third "subsections" listing

@pos
Scenario Outline: Change pos
Given info_subsection exist with info_section: that info_section, filename: "mitos1", pos: 1
Given info_subsection exist with info_section: that info_section, filename: "mitos2", pos: 2
And a pair exists with locale: "en", key: "mitos1_content_key", value: "first"
And a pair exists with locale: "en", key: "mitos2_content_key", value: "second"
When I go to that info_section's info_subsections page
And I follow "<link>" within the <order> "subsections" listing
Then I should see "second" within the first "subsections" listing
And I should see an "Mitos2thumb" image within the first "subsections" listing
And I should see "first" within the second "subsections" listing
And I should see an "Mitos1thumb" image within the second "subsections" listing
Examples:
| link | order  |
| ▼    | first  |
| ▲    | second |

@pos @japanese
Scenario Outline: Change pos
Given info_subsection exist with info_section: that info_section, filename: "mitos1", pos: 1
And an info_subsection exist with info_section: that info_section, filename: "mitos2", pos: 2
And a pair exists with locale: "ja", key: "mitos1_content_key", value: "一番"
And a pair exists with locale: "ja", key: "mitos2_content_key", value: "二番"
When I go to that info_section's info_subsections page
And I follow "日本語" within the "user nav" section
And I follow "<link>" within the <order> "subsections" listing
Then I should see "二番" within the first "subsections" listing
And I should see "一番" within the second "subsections" listing
Examples:
| link | order  |
| ▼    | first  |
| ▲    | second |

Scenario: Links for admin
Given I am logged in as admin
When I go to that info_section's info_subsections page
Then I should see links "Edit Info Section, Delete Info Section" at the bottom of the page

Scenario: Deleted Info Section are not to be visible in the menu
Given an info_section exists with title: "Ishinomaki", marked_deleted: 1 
When I go to that info_section's info_subsections page
Then I should not see "Ishinomaki" within the "submenu" section 
