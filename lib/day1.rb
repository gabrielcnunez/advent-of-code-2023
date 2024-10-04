# --- Day 1: Trebuchet?! ---
# Something is wrong with global snow production, and you've been selected to 
# take a look. The Elves have even given you a map; on it, they've used stars 
# to mark the top fifty locations that are likely to be having problems.

# You've been doing this long enough to know that to restore snow operations, 
# you need to check all fifty stars by December 25th.

# Collect stars by solving puzzles. Two puzzles will be made available on each 
# day in the Advent calendar; the second puzzle is unlocked when you complete 
# the first. Each puzzle grants one star. Good luck!

# You try to ask why they can't just use a weather machine ("not powerful enough") 
# and where they're even sending you ("the sky") and why your map looks mostly 
# blank ("you sure ask a lot of questions") and hang on did you just say the sky 
# ("of course, where do you think snow comes from") when you realize that the Elves 
#   are already loading you into a trebuchet ("please hold still, we need to strap you in").

# As they're making the final adjustments, they discover that their calibration 
# document (your puzzle input) has been amended by a very young Elf who was 
# apparently just excited to show off her art skills. Consequently, the Elves 
# are having trouble reading the values on the document.

# The newly-improved calibration document consists of lines of text; each line 
# originally contained a specific calibration value that the Elves now need to recover. 
# On each line, the calibration value can be found by combining the first digit and 
# the last digit (in that order) to form a single two-digit number.

# For example:

# 1abc2
# pqr3stu8vwx
# a1b2c3d4e5f
# treb7uchet
# In this example, the calibration values of these four lines are 12, 38, 15, and 77. 
# Adding these together produces 142.

# Consider your entire calibration document. What is the sum of all of the calibration values?

def values(str)
  value_matches = str.scan(/[0-9]/)
  [value_matches[0], value_matches[-1]].join.to_i
end

def sum(str)
  str.split.map { |e| values(e) }.sum
end

def real_values(str)
  number_words = {
  "one" => "1",
  "two" => "2",
  "three" => "3",
  "four" => "4",
  "five" => "5",
  "six" => "6",
  "seven" => "7",
  "eight" => "8",
  "nine" => "9"
  }

  values = ''
  str_builder = ''
  chars_array = str.chars

  catch(:done) do
    chars_array.each do |char|
      values << char and throw(:done) if char.match?(/[0-9]/)
      str_builder << char
      next if str_builder.size < 3
      
      number_words.each do |word, num|
        if str_builder.include?(word)
          values << num
          str_builder = ''
          throw(:done) 
        end
      end
    end
  end

  catch(:done) do
    chars_array.reverse_each do |char|
      values << char and throw(:done) if char.match?(/[0-9]/)
      str_builder.prepend(char)
      next if str_builder.size < 3
      
      number_words.each do |word, num|
        if str_builder.include?(word)
          values << num
          throw(:done) 
        end
      end
    end
  end

  values.to_i
end

def real_sum(str)
  str.split.map { |e| real_values(e) }.sum
end

file_path = File.expand_path("day1_input.txt", __dir__)
input = File.read(file_path)

puts sum(input)
puts real_sum(input)
