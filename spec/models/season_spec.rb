require_relative '../spec_helper'

describe 'A Season' do
  before do 
    series_summary ||= Imdb::Serie.new('0898266')
    number = 1
    @season = Season.new(series_summary, number)
  end

  it "should have a number of episodes" do
    expect(@season.number_of_episodes).to eq 18 
  end

end
