require 'rubygems'
require 'sinatra'
require 'torrent_api'
require 'imdb'

require_relative 'models/series'
require_relative 'models/season'

class Popeye < Sinatra::Base
  get '/' do
    erb :index 
  end

  get "/search/:query" do
    t = TorrentApi.new
     
    t.search_term = 'vampire diaries'
    results = t.search
    puts results
  end
end




