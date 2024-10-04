require 'rspec'
require './lib/day1.rb'

describe 'Day 1: Trebuchet?!' do
  describe "Calibration Values" do
    it "takes string, returns integer based on first and last digit of string" do
      expect(values('1abc2')).to eq(12)
      expect(values('pqr3stu8vwx')).to eq(38)
      expect(values('a1b2c3d4e5f')).to eq(15)
      expect(values('treb7uchet')).to eq(77)
    end
  end
end
