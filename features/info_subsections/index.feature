Feature:
Background:
Given an info_section exists with title: "Onagawa"
And I am logged in as admin

Scenario: Info Subsection Index view
Given an info_subsection exists with info_section: that info_section, content: "Onagawa was a beautiful city.", pos: 1
When I go to that info_section's info_subsections page
Then I should see "Onagawa was a beautiful city." within the first "subsections" listing
And I should see an "Onagawa1thumb" image within the first "subsections" listing 
And the submenu "Onagawa" should be active

Scenario: Position arrows on subsections 
Given 3 info_subsections exist with info_section: that info_section
When I go to that info_section's info_subsections page
Then show me the page
Then I should see "▼" but not "▲" within the first "subsections" listing
And I should see "▼" and "▲" within the second "subsections" listing
And I should see "▲" but not "▼" within the third "subsections" listing
