source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.0'
# Use Puma as the app server
gem 'puma', '~> 3.7'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use jquery as the JavaScript library
gem 'jquery-rails', '4.1.1'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

gem 'groupdate'


# Use Hirb for console table display
gem 'hirb', '~> 0.7.3'

# bootstrap css framework and dependencies
gem 'bootstrap-sass', '~> 3.3.6'

gem 'react-rails'

# Ice Cube for Schedule creation
gem 'ice_cube', '0.16.1'

# chartkick + high charts for dashboard charts
gem 'chartkick'

gem 'responders'

# devise for authentication and user management
gem 'bcrypt', git: 'https://github.com/codahale/bcrypt-ruby.git', :require => 'bcrypt'
gem 'devise', git: 'https://github.com/plataformatec/devise.git', branch: 'master'
gem 'wdm', '>= 0.1.0' if Gem.win_platform?

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :production do
  # Use PostGreSQL for heroku database
  gem 'pg', '0.18.4'
end

group :development, :test do
  # Use sqlite3 as the test and development database for Active Record
  gem 'sqlite3', '1.3.12'
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 2.13.0'
  gem 'selenium-webdriver'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'web-console', '>= 3.3.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
