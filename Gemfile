source 'https://rubygems.org'

ruby '2.5.0'

gem 'rails', '~> 5.1.4'
gem 'bcrypt' # Required for has_secure_password method
gem 'omniauth-facebook' # Facebook Oauth2 strategy
gem 'omniauth-google-oauth2' # Google Oauth2 strategy
gem 'http' # http library required for yelp api
gem 'font-awesome-rails' # Icons (fontawesome.com)
gem 'faker' # Generates random text for seeding/populating development environment
gem 'will_paginate' # Enables pagination
gem 'bootstrap-will_paginate' # Enables pagination
gem 'carrierwave' # Image uploader
gem 'mini_magick' # Image editng library. Used for resizing uploads
gem 'bootstrap-filestyle-rails' # Cross browser file upload button support
gem 'puma', '~> 3.7' # Puma app Server
gem 'bootstrap-sass', '~> 3.3.7'  # Use SCSS for stylesheets
gem 'jquery-rails' # JQuery library in asset pipeline
gem 'sass-rails', '~> 5.0' # # Use SCSS for stylesheets
gem 'uglifier', '>= 1.3.0' # Use Uglifier as compressor for JavaScript assets
gem 'coffee-rails', '~> 4.2' # Use CoffeeScript for .coffee assets and views
gem 'jbuilder', '~> 2.5'  # Read more: https://github.com/rails/jbuilder

group :development, :test do
  gem 'sqlite3' # Use sqlite3 as the database for Active Record
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'dotenv-rails'  # hides api env variables
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'rails-controller-testing'
  gem 'minitest-reporters'
  gem 'guard'
  gem 'guard-minitest'
end

group :production do
  gem 'pg'  # Use PostgreSQL in prodcuction on Heroku
  gem 'fog' # Cloud services library enabling image upload/storage to AWS S3
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
