require 'imdb'

class Series 

  def initialize(name)
    @name = name
  end

  def number_of_seasons
    series_summary.seasons.size
  end

  def season(number)
    season = Season.new(series_summary, number)
    season
  end
  
  private
  def search 	    
    if @correct_series.nil? 
      search = Imdb::Search.new(@name)
      only_series = search.movies.select { |result| result.title =~ /#{@name}[\w\s()]+\(TV Series\)/ }  
      @correct_series = only_series.select{ |r| r.title !~ /TV Episode/ }
    end
    @correct_series
  end

  def series_summary
    @series_summary ||= Imdb::Serie.new(search.first.id)
  end
end
