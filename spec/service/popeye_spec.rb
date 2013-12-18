require_relative '../spec_helper'
include StoryHelpers

require 'rack/test'
# Set the rack environment to `test`
ENV["RACK_ENV"] = "test"

describe 'The Popeye App' do
  include Rack::Test::Methods

  def app
    Popeye
  end
  
  describe "GET /" do
    before do
      get '/'
    end

    let(:resp) { json_parse(last_response.body) }
    it { resp[:status].should eq "success" }
  end

  describe "GET /series/veep" do
    before do
      get '/series/veep'
    end

    let(:resp) { json_parse(last_response.body) }
    it { resp[:status].should eq "success" }
  end

  describe "GET /series/big bang theory" do
    before do
      get URI.escape('/series/big bang theory')
    end

    let(:resp) { json_parse(last_response.body) }
    it { resp[:status].should eq "success" }
    it { resp[:seasons].size.should eq 8 }
    it { resp[:title].should eq "The Big Bang Theory" }
    it { resp[:imdb_id].should eq "0898266" }
  end


end

