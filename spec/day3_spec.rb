require 'rspec'
require './lib/day3.rb'

describe 'Day 3: Gear Ratios' do
  describe "Sum of All Part Numbers" do
    it "takes string of engine schematic, returns sum of all part numbers" do
      expect(part_numbers_sum('467..114..
      ...*......
      ..35..633.
      ......#...
      617*......
      .....+.58.
      ..592.....
      ......755.
      ...$.*....
      .664.598..')).to eq(4361)
    end
  end

  describe "Sum of All Gear Ratios" do
    it "takes string of engine schematic, returns sum of all gear ratios" do
      expect(gear_ratios_sum('467..114..
      ...*......
      ..35..633.
      ......#...
      617*......
      .....+.58.
      ..592.....
      ......755.
      ...$.*....
      .664.598..')).to eq(467835)
    end
  end
end
