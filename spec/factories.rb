Factory.define :info_section do |f|
  f.sequence(:title){|n| "Factory Info Section Title #{n}"}
  f.sequence(:pos){|n| n}
end

Factory.define :info_subsection do |f|
  f.association :info_section, :factory => :info_section
end

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
