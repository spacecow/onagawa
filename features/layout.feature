Feature:

Scenario Outline: Page links
When I go to the root page
And I follow "<link>"
Then I should be on the <path> page
Examples:
|link|path|
|Info|info|
|Contact|new message|
|Order|new order|
