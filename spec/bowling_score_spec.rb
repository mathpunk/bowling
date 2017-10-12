require "bowling_score"

describe Bowling do
  before(:each) do
    @game = Bowling.new
  end

  it "scores a gutter game" do
    20.times { @game.roll 0 }
    expect(@game.score).to eq 0
  end

  it "scores all ones" do
    20.times { @game.roll 1 }
    expect(@game.score).to eq 20
  end

  it "scores a spare" do
    2.times { @game.roll 5 }
    @game.roll 1
    17.times {@game.roll 0}
    expect(@game.score).to eq 12
  end

  it "scores a strike" do
    @game.roll 10
    2.times { @game.roll  1}
    16.times { @game.roll 0 }
    expect(@game.score).to eq 14
  end

  it "scores a perfect game" do
    12.times { @game.roll 10 }
    expect(@game.score).to eq 300
  end
end
