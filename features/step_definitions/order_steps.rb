When /^I complete an order$/ do
  When %(I go to the new order page)
  And %(I fill in "First name" with "Test")
  And %(I fill in "Last name" with "Name")
  And %(I fill in "Email" with "test@example.com")
  And %(I fill in "Address" with "Test Street 12")
  And %(I fill in "City" with "Test Town")
  And %(I fill in "Postal/Zip" with "2345 Town")
  And %(I select "Canada" from "Country")
  And %(I press "Continue to Purchase")
end

