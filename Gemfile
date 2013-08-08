#Gemfile
source 'https://rubygems.org'
#ruby=jruby-1.7.4
# ruby "2.0.0"
gem 'rack', '~> 1.5'
gem 'sinatra' 
gem 'kramdown' # for markdown
gem 'haml'
gem 'i18n'
gem 'rack-contrib' #for Rack::Locale, etc.
gem 'bundler'
gem 'coffee-script'

# For Models:
# gem 'sqlite3', :platforms => :ruby
# gem 'activerecord'
# gem 'sinatra-activerecord'
#
# platforms :jruby do
# gem 'jdbc-sqlite3'
# gem 'activerecord-jdbc-adapter'
# end

#Optional Stuff not implemented yet
# gem 'sinatra-simple-navigation', require: false #for breadcrumbs
# gem 'gon-sinatra', :require => false #for gon (moves @variables to javascrip)
# gem 'therubyracer' #for coffee-script
# gem 'fastimage', :require => false #for getting image sizes

group :development do
  gem 'rvm-capistrano'
  gem 'pry'
  gem 'shotgun'
  gem 'puma', '~> 2.0'
  gem 'localeapp', require: false
end

group :deploy do
  platforms :jruby do
    gem 'warbler' 
    gem 'net-ssh', :require => "net/ssh"
    gem 'net-scp', :require => "net/scp" 
    gem 'torquebox-remote-deployer'
  end
end

group :production do
  gem 'puma', '~> 2.0'
end

group :test do
  gem 'rspec'
  gem 'capybara'
  gem 'rack', '~> 1.5'
  gem 'rack-test'
  gem 'selenium-webdriver'
  gem 'capybara-webkit'
end

group :development, :test do
  gem 'cucumber'
  gem 'cucumber-sinatra'
  gem 'rake'
end