Feature:

Scenario: View of contact page
Given a setting exists with contact_info: "That's how I role."
When I go to the new message page
Then the "Name" field should be empty 
And the "Email" field should be empty
And the "Message" field should be empty
And I should see a "Send Message" button
And I should see "That's how I role."

@japanese
Scenario: View of contact page in japanese
Given a setting exists with contact_info_ja: "日本語です"
When I go to the new message page
And I follow "日本語" within the "user_nav" section
Then the "お名前" field should be empty 
And the "Eメール" field should be empty
And the "メッセージ" field should be empty
And I should see a "メッセージ発送" button
And I should see "日本語です"
