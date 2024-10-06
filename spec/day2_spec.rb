require 'rspec'
require './lib/day1.rb'

describe 'Day 2: Cube Conundrum' do
  describe "Is This Game Possible" do
    it "takes string and number of colored cubes, returns bool if game is possible" do
      expect(possible?('Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green')).to eq(true)
      expect(possible?('Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue')).to eq(true)
      expect(possible?('Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red')).to eq(false)
      expect(possible?('Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red')).to eq(false)
      expect(possible?('Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green')).to eq(true)
    end
  end

  describe 'Sum of Possible Game IDs' do
    it 'sums the game IDs of all possible games' do
      games = 'Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green
      Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue
      Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red
      Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red
      Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green'
      expect(id_sum(games)).to eq(8)
    end
  end
end