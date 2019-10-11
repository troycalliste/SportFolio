source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.4'
# Use postgres as the database for Active Record
gem 'pg'
# Use Puma as the app server
gem 'puma', '~> 3.0'
ruby "2.5.0p0"
# gem 'thin'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
 # Use jquery as the JavaScript library
gem 'bootstrap'
gem 'jquery-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
gem 'openssl'
# gem 'intrinio-realtime'
gem 'thread'
gem 'geocoder'
# gem 'redis', '~> 3.0'

gem 'whenever', require: false
# Use ActiveModel has_secure_password
gem 'crono'
gem 'bcrypt', git: 'https://github.com/codahale/bcrypt-ruby.git', require: 'bcrypt' if Gem.win_platform?
# gem 'httparty'
gem 'delayed_job_active_record'
gem 'delayed_job_recurring'

gem 'rest-client', '~> 1.8'
gem 'devise'
gem 'devise_lastseenable'
# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development
gem 'gravtastic'

gem 'simple_form'

gem 'carrierwave', '~> 1.0'
gem "paperclip", git: "git://github.com/thoughtbot/paperclip.git"
gem 'will_paginate'

# User Authentication with Facebook
gem 'omniauth-facebook'
# Development ENV Variables
gem 'figaro'

gem 'omniauth-google-oauth2', '~> 0.4.1'
gem 'google-api-client', '~> 0.10.3'
gem 'activerecord-session_store', '~> 1.0'

gem 'nokogiri'
gem 'clockwork'
gem 'sidekiq'
gem 'activeadmin', github: 'activeadmin'


group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri

end
group :production, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console



end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'

end



# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
