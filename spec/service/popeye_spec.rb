require 'spec_helper'
ENV['RACK_ENV'] = 'test'

require 'rack/test'

describe 'The Popeye  App' do
  include Rack::Test::Methods

  def app
    Popeye
  end

  it "renders a home page" do
    get '/'
    expect(last_response).to be_ok
  end
end
