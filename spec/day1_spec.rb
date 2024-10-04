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

  describe 'Sum of Calibration Values' do
    it 'sums all the calibration values' do
      cal_vals = '1abc2
      pqr3stu8vwx
      a1b2c3d4e5f
      treb7uchet'

      expect(sum(cal_vals)).to eq(142)
    end
  end

  describe 'Real Calibration Values' do
    it 'takes string, returns integer based on first and last digits, which include digits spelled out' do
      expect(real_values('two1nine')).to eq(29)
      expect(real_values('eightwothree')).to eq(83)
      expect(real_values('abcone2threexyz')).to eq(13)
      expect(real_values('xtwone3four')).to eq(24)
      expect(real_values('4nineeightseven2')).to eq(42)
      expect(real_values('zoneight234')).to eq(14)
      expect(real_values('7pqrstsixteen')).to eq(76)
    end
  end

  describe 'Sum of Real Calibration Values' do
    it 'sums all the real calibration values' do
      cal_vals = 'two1nine
        eightwothree
        abcone2threexyz
        xtwone3four
        4nineeightseven2
        zoneight234
        7pqrstsixteen'

      expect(real_sum(cal_vals)).to eq(281)
    end
  end
end
