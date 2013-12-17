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
end




