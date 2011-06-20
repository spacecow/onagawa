Feature:
Background:
Given an info_section exists with title: "Mitos"
And I am logged in as admin

Scenario: Info Section Edit View
Given an info_section exists with title: "Imaginary Town"
When I go to that info_section's edit page
Then the "Title" field should contain "Imaginary Town"
And the first through fourth "Content" field should be empty
And the first "Filename" field should contain "imaginary_town1"
And the second "Filename" field should contain "imaginary_town2"
And the third "Filename" field should contain "imaginary_town3"
And the fourth "Filename" field should contain "imaginary_town4"
And I should see a "New Info Section" link within the "submenu" section
And the submenu "Imaginary Town" should be active

Scenario: Info Subsection Edit View
Given an info_subsection exists with info_section: that info_section, filename: "Mitos1", pos: 1
And a pair exists with locale: "en", key: "mitos1_content_key", value: "Mitos was a beautiful little town."
And a pair exists with locale: "ja", key: "mitos1_content_key", value: "女川魚"
And a pair exists with locale: "en", key: "mitos2_content_key", value: ""
And a pair exists with locale: "ja", key: "mitos2_content_key", value: ""
When I go to that info_section's edit page
Then the first "Content (EN)" field should contain "Mitos was a beautiful little town."
And the first "Content (JA)" field should contain "女川魚"
And the first "Filename" field should contain "Mitos1"
And the second through fourth "Content (EN)" field should be empty
And the second through fourth "Content (JA)" field should be empty

Scenario: Edit an info subsection
Given an info_subsection exists with info_section: that info_section, filename: "mitos1", pos: 1 
And a pair exists with locale: "en", key: "mitos1_content_key", value: "Mitos was a beautiful little town."
And a pair exists with locale: "ja", key: "mitos1_content_key", value: "女川魚"
When I go to that info_section's edit page
And I fill in the first "Content (EN)" with "Mitos will be beautiful again."
And I fill in the first "Content (JA)" with "日本語"
And I fill in the first "Filename" with "mitos2"
And I press "Update Info Section"
Then an info_section should exist with title: "Mitos"
And 1 info_sections should exist
And an info_subsection should exist with info_section: that info_section, filename: "mitos2", pos: 1
And 1 info_subsections should exist
And a pair should exists with key: "en.mitos1_content_key", value: "Mitos will be beautiful again."
And a pair should exists with key: "ja.mitos1_content_key", value: "日本語"

Scenario: Create a new info_subsection to an existing info section
Given an info_subsection exists with info_section: that info_section, filename: "Mitos1", pos: 1
And a pair exists with locale: "en", key: "mitos1_content_key", value: "Mitos was a beautiful little town."
When I go to that info_section's edit page
And I fill in the second "Content (EN)" with "Mitos will be beautiful again."
And I fill in the second "Filename" with "Mitos2"
And I press "Update Info Section"
Then an info_section should exist with title: "Mitos"
And 1 info_sections should exist
And 2 info_subsections should exist
And 1 info_sections should exist
And an info_subsection should exist with info_section: that info_section, filename: "Mitos1", pos: 1
And a pair should exists with key: "en.mitos1_content_key", value: "Mitos was a beautiful little town."
And an info_subsection should exist with info_section: that info_section, filename: "Mitos2", pos: 2
And a pair should exists with key: "en.mitos2_content_key", value: "Mitos will be beautiful again."

Scenario: Info subsections should be dipslayed in order after position
Given an info_subsection exists with info_section: that info_section, filename: "mitos2", pos: 2
And an info_subsection exists with info_section: that info_section, filename: "mitos1", pos: 1
When I go to that info_section's edit page
Then the first "Filename" field should contain "mitos1"
And the second "Filename" field should contain "mitos2"
And the third "Filename" field should contain "mitos3"
And the fourth "Filename" field should contain "mitos4"
