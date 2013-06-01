#Gemfile
source 'https://rubygems.org'
gem 'rack'
gem 'sinatra' 
gem 'rdiscount' 
gem 'haml'
gem 'i18n'
gem 'rack-contrib' #for Rack::Locale
gem 'bundler'
gem 'fastimage', :require => false #for getting image sizes
gem 'therubyracer'

# For Models:
# gem 'sqlite3' #gem 'pg'
# gem 'activerecord'
# gem 'sinatra-activerecord'

#Optional Stuff not implemented yet
# gem 'sinatra-simple-navigation', require: false #for breadcrumbs
gem 'gon-sinatra', :require => false


group :development do
  gem 'capistrano-puma', require: false
  gem 'rvm-capistrano'
  gem 'pry'
  gem 'shotgun'
  gem 'thin'
  gem 'localeapp', require: false 
end

group :production do
  gem 'puma', '~> 2.0'
end

group :test do
  gem 'rspec'
  gem 'capybara'
  gem 'rack'
  gem 'rack-test'
end

group :development, :test do
  gem 'cucumber'
  gem 'cucumber-sinatra'
end