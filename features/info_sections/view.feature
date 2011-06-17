Feature:
Background:
Given an info_section exists with title: "Onagawa"

Scenario: Default info subsection is the one with the lowest position
Given an info_subsection: "2" exists with info_section: that info_section, pos: 2
And an info_subsection: "1" exists with info_section: that info_section, pos: 1, filename: "Onagawa1"
When I go to that info_section page
Then I should see a "Onagawa1" image

Scenario Outline: Subsection view
Given an info_subsection exists with info_section: that info_section, content: "This was before called the city Onagawa.", filename: "Onagawa<no>" 
When I go to that info_section page
Then I should see a "Onagawa<no>" image
And I should see a "Onagawa<no>colour" image
And I should see "This was before called the city Onagawa."
Examples:
|no|
|1|
|2|

@japanese
Scenario: Subsection View in Japanese
Given an info_subsection exists with info_section: that info_section, content_ja: "女川魚", filename: "Onagawa<no>" 
When I go to that info_section page
And I follow "日本語"
Then I should see "女川魚"

Scenario: Thumbs are displayed for all subsections within a section
Given an info_subsection exists with info_section: that info_section, filename: "onagawa1"
And an info_subsection exists with info_section: that info_section, filename: "onagawa2"
When I go to that info_section page
Then I should see a "Onagawa1thumb" image
And I should see a "Onagawa2thumb" image
And I should see no "Onagawa3thumb" image

Scenario Outline: Thumb links on the info section page
Given an info_subsection exists with info_section: that info_section, filename: "onagawa1"
And an info_subsection exists with info_section: that info_section, filename: "onagawa2"
When I go to that info_section page
And I click the image "<thumb>"
Then I should see a "<image>" image
Examples:
|thumb|image|
|Onagawa1thumb|Onagawa1|
|Onagawa2thumb|Onagawa2|

Scenario: Links for admin
Given I am logged in as admin
When I go to that info_section page
Then I should see links "Edit Info Section, List Subsections" at the bottom of the page
