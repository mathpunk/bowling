
require 'rspec'
require 'bowling_score'

describe "BowlingScore" do
  before (:each) do
    @game = BowlingScore.new
  end
  it 'can create a game' do
    expect(@game).to be_truthy
  end
  it 'has a beginning score of zero' do
    expect(@game.score).to eq 0
  end
  it 'can roll a gutter game' do
    20.times{@game.roll(0)}
    expect(@game.score).to eq 0
  end
  it "scores a open frame" do
    @game.roll(2)
    @game.roll(4)
    expect(@game.score).to eq 6
  end
  it 'scores a spare' do
    @game.roll(5)
    @game.roll(5)
    @game.roll(3)
    @game.roll(0)
    expect(@game.score).to eq 16
  end
  it 'scores two spares' do
    @game.roll(5)
    @game.roll(5)
    @game.roll(3)
    @game.roll(7)
    @game.roll(1)
    @game.roll(0)
    expect(@game.score).to eq 25
  end
  it 'can score no spare plus a spare' do
    @game.roll(0)
    @game.roll(2)
    @game.roll(5)
    @game.roll(5)
    @game.roll(6)
    @game.roll(0)
    expect(@game.score).to eq 24
  end
  it 'scores a strike and an open frame' do
    @game.roll(10)
    @game.roll(2)
    @game.roll(2)
    expect(@game.score).to eq 18
  end
end
