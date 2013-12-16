require File.join(File.dirname(__FILE__), '..', 'popeye.rb')

require 'rspec'
require 'sinatra'

# setup test environment
set :environment, :test
set :run, false
set :raise_errors, true
set :logging, false

def app
  Sinatra::Application
end

RSpec.configure do |config|
end
