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
  
  def title 
    series_summary.title.gsub(/\"/, '')
  end

  def to_json 
    {
      title: title,
      seasons: number_of_seasons,
      imdb_id: @imdb_id
    }
  end
  
  private
  def search
    if @correct_series.nil? 
      search = Imdb::Search.new(@name)
      only_series = search.movies.select { |result| result.title =~ /#{@name}[\w\s()]+\(TV Series\)/i }
      @correct_series = only_series.select{ |r| r.title !~ /TV Episode/i }
    end
    @correct_series
  end

  def series_summary
    @imdb_id ||= search.first.id
    @series_summary ||= Imdb::Serie.new(@imdb_id)
  end
end
