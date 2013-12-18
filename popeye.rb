require 'rubygems'
require 'sinatra'
require 'torrent_api'
require 'imdb'
require 'multi_json'
require 'json'

require_relative 'models/series'
require_relative 'models/season'

class Popeye < Sinatra::Base
  get '/' do
    content_type :json
    { status: "success" }.to_json
  end

  get '/series/:name' do
    content_type :json
    series = Series.new(URI.unescape(params[:name]))
    result = {status: "success"}.merge(series.to_json)
    result.to_json
  end
end

