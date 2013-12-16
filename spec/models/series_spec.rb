require_relative '../spec_helper'

describe "A valid series" do
  before do
    @series = Series.new("Big Bang Theory")
  end

  it "should find the number of seasons" do
    expect(@series.number_of_seasons).to eq 7 
  end

  it "should return a specific season" do
    expect(@series.season(1)).to be_a Season
  end
  
end
