# Generated by cucumber-sinatra. (2013-05-07 14:20:35 -0400)

ENV['RACK_ENV'] = 'test'

require File.join(File.dirname(__FILE__), '..', '..', 'app/main.rb')

require 'capybara'
require 'capybara/cucumber'
require 'rspec'

Capybara.app = JCA_1

class JCA_1World
  include Capybara::DSL
  include RSpec::Expectations
  include RSpec::Matchers
end

World do
  JCA_1World.new
end
