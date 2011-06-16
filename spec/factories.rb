Factory.define :info_section do |f|
  f.sequence(:title){|n| "Factory Title #{n}"}
  f.sequence(:pos){|n| n}
end

Factory.define :info_subsection do |f|
  f.association :info_section, :factory => :info_section
  f.sequence(:pos){|n| n}
  f.content "Factory Content"
  f.filename "factory.file"
end

Factory.define :locale do |f|
  f.title "en"
end

Factory.define :message do |f|
  f.name "Default factory name"
  f.email "default@factory.mail"
  f.content "Default factory content."
end

Factory.define :translation do |f|
  f.association :locale
  f.key "welcome"
  f.value "Welcome!"
end

Factory.define :user do |f|
  f.sequence(:username){|n| "username#{n}"}
  f.sequence(:email){|n| "default#{n}@email.com"}
  f.password "abc123"
end
