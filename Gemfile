source 'http://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.0', '>= 5.0.0.1'
# Use postgres as the database for Active Record
gem 'pg'
# Use Puma as the app server
gem 'puma', '~> 3.0'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
gem 'mini_racer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# add Twitter Bootstrap 4
gem 'bootstrap', '~> 4.0.0.alpha3'
# devise for user login and role management
gem 'devise'
#  display messages
gem 'toastr-rails'

gem 'cancancan'

gem "paperclip", "~> 5.0.0"

gem 'sunspot_rails'

# optional pre-packaged Solr distribution for use in development
gem 'sunspot_solr'

gem "sunspot-rails-tester"

gem 'progress_bar'

# Access Authy API
gem 'authy', '~> 2.7', '>= 2.7.1'

gem 'faraday', '~> 0.9.2'

# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
  gem 'factory_girl_rails', '~> 4.8.0'
  gem 'rspec-rails', '3.5.0'
  gem 'rspec', '3.5.0'
  gem 'rspec-core', '3.5.0'
  gem 'rspec-expectations', '3.5.0'
  gem 'rspec-mocks', '3.5.0'
  gem 'rspec-support', '3.5.0'
  gem 'rails-controller-testing'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]