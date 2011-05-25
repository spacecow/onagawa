Feature:
Background:
Given an info_section exists with title: "Onagawa"

Scenario Outline: Subsection view
Given an info_subsection exists with info_section: that info_section, pos: <no>, content: "This was before called the city Onagawa." 
When I go to that info_section page
Then I should see a "Onagawa<no>" image
And I should see a "Onagawa<no>colour" image
And I should see "This was before called the city Onagawa."
Examples:
|no|
|1|
|2|

Scenario: Image can be set explicitly
Given an info_subsection exists with info_section: that info_section, pos: 1, filename: "onagawa2"
When I go to that info_section page
Then I should see a "Onagawa2" image
And I should see a "Onagawa2colour" image

Scenario: Thumbs are displayed for all subsections within a section
Given an info_subsection exists with info_section: that info_section, pos: 1
And an info_subsection exists with info_section: that info_section, pos: 2
