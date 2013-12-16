class Season
  def initialize(series_summary, number)
    @series_summary = series_summary
    @number = number 
  end

  def number_of_episodes
    @series_summary.season(@number).episodes.size
  end
end
