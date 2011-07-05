When /^I complete a profile$/ do
  When %(I go to the new profile page)
  And %(I fill in "First name" with "Test")
  And %(I fill in "Last name" with "Name")
  And %(I fill in "Email" with "test@example.com")
  And %(I fill in "Phone" with "123456")
  And %(I fill in "Address" with "Test Street 12")
  And %(I fill in "City" with "Test Town")
  And %(I fill in "Postal/Zip" with "2345")
  And %(I select "Canada" from "Country")
  And %(I press "Continue to Purchase")
end

