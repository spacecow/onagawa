Feature:
Background:
Given an info_section exists with title: "Mitos"

Scenario: Default info subsection is the one with the lowest position
Given an info_subsection: "2" exists with info_section: that info_section, pos: 2
And an info_subsection: "1" exists with info_section: that info_section, pos: 1, filename: "mitos1"
When I go to that info_section page
Then I should see a "Mitos1" image

Scenario Outline: Subsection view
Given an info_subsection exists with info_section: that info_section, filename: "mitos<no>", pos: 1
And a pair exists with locale: "en", key: "mitos1_content_key", value: "This was before called the city Mitos."
When I go to that info_section page
Then I should see an "Mitos<no>" image
And I should see an "Mitos<no>colour" image
And I should see "This was before called the city Mitos."
Examples:
|no|
|1|
|2|

@japanese
Scenario: Subsection View in Japanese
Given an info_subsection exists with info_section: that info_section, pos: 1
And a pair exists with locale: "ja", key: "mitos1_content_key", value: "女川魚"
When I go to that info_section page
And I follow "日本語"
Then I should see "女川魚"

Scenario: Thumbs are displayed for all subsections within a section
Given an info_subsection exists with info_section: that info_section, filename: "mitos1"
And an info_subsection exists with info_section: that info_section, filename: "mitos2"
When I go to that info_section page
Then I should see a "Mitos1thumb" image
And I should see a "Mitos2thumb" image
And I should see no "Mitos3thumb" image

Scenario Outline: Thumb links on the info section page
Given an info_subsection exists with info_section: that info_section, filename: "mitos1"
And an info_subsection exists with info_section: that info_section, filename: "mitos2"
When I go to that info_section page
And I click the image "<thumb>"
Then I should see a "<image>" image
Examples:
|thumb|image|
|Mitos1thumb|Mitos1|
|Mitos2thumb|Mitos2|

Scenario: Links for admin
Given I am logged in as admin
When I go to that info_section page
Then I should see links "Edit Info Section, List Subsections, Delete Info Section" at the bottom of the page

Scenario Outline: The Info Link should be active
Given I am logged in as admin
When I go to <path> page
Then the menu "Info" should be active 
Examples:
| path                                 |
| that info_section                    |
| that info_section's edit             |
| the new info_section                 |
| that info_section's info_subsections |
