require_relative '../spec_helper'
ENV['RACK_ENV'] = 'test'

require 'rack/test'

describe 'The Popeye  App' do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  it "renders a home page" do
    get '/'
    expect(last_response).to be_ok
  end
end
