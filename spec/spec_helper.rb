require File.join(File.dirname(__FILE__), '..', 'popeye.rb')

require 'rspec'
require 'sinatra'

require_relative "support/story_helpers.rb"

# setup test environment
set :environment, :test
set :run, false
set :raise_errors, true
set :logging, false

def app
  Sinatra::Application
end

