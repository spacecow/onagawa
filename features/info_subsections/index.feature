Feature:
Background:
Given an info_section exists
And I am logged in as admin

Scenario: Info Subsection Index view
Given an info_subsection exists with info_section: that info_section, content: "Onagawa was a beautiful city."
When I go to that info_section's info_subsections page
Then I should see "Onagawa was a beautiful city." within the first "subsections" listing
