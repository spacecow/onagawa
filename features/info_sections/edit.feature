Feature:
Background:
Given an info_section exists with title: "Onagawa"
And I am logged in as admin

Scenario: Info Section Edit View
When I go to that info_section's edit page
Then the "Title" field should contain "Onagawa"
And the first through fourth "Content" field should be empty
And the first "Filename" field should contain "onagawa1"
And the second "Filename" field should contain "onagawa2"
And the third "Filename" field should contain "onagawa3"
And the fourth "Filename" field should contain "onagawa4"
And I should see a "New Info Section" link within the "submenu" section

Scenario: Info Subsection Edit View
Given an info_subsection exists with info_section: that info_section, content: "Onagawa was a beautiful little town.", filename: "Onagawa1", pos: 1
When I go to that info_section's edit page
Then the first "Content" field should contain "Onagawa was a beautiful little town."
And the first "Filename" field should contain "Onagawa1"
And the second through fourth "Content" field should be empty

Scenario: Edit an info subsection
Given an info_subsection exists with info_section: that info_section, content: "Onagawa was a beautiful little town.", filename: "Onagawa1", pos: 1
When I go to that info_section's edit page
And I fill in the first "Content" with "Onagawa will be beautiful again."
And I fill in the first "Filename" with "Onagawa2"
And I press "Update Info Section"
Then an info_section should exist with title: "Onagawa"
And 1 info_sections should exist
And an info_subsection should exist with info_section: that info_section, content: "Onagawa will be beautiful again.", filename: "Onagawa2", pos: 1
And 1 info_subsections should exist

Scenario: Create a new info_subsection to an existing info section
Given an info_subsection exists with info_section: that info_section, content: "Onagawa was a beautiful little town.", filename: "Onagawa1", pos: 1
When I go to that info_section's edit page
And I fill in the second "Content" with "Onagawa will be beautiful again."
And I fill in the second "Filename" with "Onagawa2"
And I press "Update Info Section"
Then an info_section should exist with title: "Onagawa"
And 1 info_sections should exist
And 2 info_subsections should exist
And 1 info_sections should exist
And an info_subsection should exist with info_section: that info_section, content: "Onagawa was a beautiful little town.", filename: "Onagawa1", pos: 1
And an info_subsection should exist with info_section: that info_section, content: "Onagawa will be beautiful again.", filename: "Onagawa2", pos: 2

Scenario: Info subsections should be dipslayed in order after position
Given an info_subsection exists with info_section: that info_section, content: "Onagawa will become beautiful again.", filename: "Onagawa2", pos: 2
And an info_subsection exists with info_section: that info_section, content: "Onagawa was a beautiful little town.", filename: "Onagawa1", pos: 1
When I go to that info_section's edit page
Then the first "Filename" field should contain "Onagawa1"
And the second "Filename" field should contain "Onagawa2"
And the third "Filename" field should contain "onagawa3"
And the fourth "Filename" field should contain "onagawa4"
