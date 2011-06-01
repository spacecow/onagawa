When /^I complete a purchase/ do
  And %(I fill in "Quantity" with "10")
  And %(I select "Visa" from "Card type")
  And %(I fill in "Card number" with "4111111111111111")
  And %(I fill in "Card verification (CVV)" with "123")
  And %(I select "2015" from "Year")
  And %(I press "Purchase")
end
