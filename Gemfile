source 'http://rubygems.org'

gem 'rake', '0.8.7'
gem 'rails', '3.0.5'
gem 'mysql2', '0.2.7'
gem 'formtastic' #rails g formtastic:install
#gem 'compass' #compass init rails /path/to/myrailsproject --using blueprint/semantic
gem 'cancan' #rails g cancan:ability
gem "bcrypt-ruby", :require => "bcrypt"
gem "mocha", :group => :test
gem 'json', '1.4.6'
gem 'annotate'
gem 'activemerchant'
gem 'geocoder'

group :development do
  gem 'jquery-rails'
  gem 'nifty-generators', :path => "~/ruby/rails/nifty-generators"
  gem "rspec-rails" #rails g rspec:install
end

group :test do
  gem 'rspec-expectations'
  gem 'spork'
  gem 'cucumber-rails', '0.3.2' #rails g cucumber:install --capybara --rspec
  gem 'cucumber', '0.10.0'
  gem 'capybara'
  gem 'database_cleaner'
  gem 'pickle' #rails g pickle --paths --email
  gem 'launchy'
  gem 'factory_girl'
  gem 'gherkin', '2.3.6'
end
