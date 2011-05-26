Feature:
Background:
Given an info_section exists with title: "Onagawa"
And I am logged in as admin

Scenario: Info Section Edit View
When I go to that info_section's edit page
Then the "Title" field should contain "Onagawa"
And the first through fourth "Content" field should be empty

Scenario: Info Subsection Edit View
Given an info_subsection exists with info_subsection: that info_subsection, content: "Onagawa was a beautiful little town.", filename: "Onagawa1"
When I go to that info_section's edit page
And the second through fourth "Content" field should be empty

@pending
Scenario: Edit an info subsection
