Factory.define :message do |f|
  f.name "Default factory name"
  f.email "default@factory.mail"
  f.content "Default factory content."
end

Factory.define :user do |f|
  f.sequence(:username){|n| "username#{n}"}
  f.sequence(:email){|n| "default#{n}@email.com"}
  f.password "abc123"
end
