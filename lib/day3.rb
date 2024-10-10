# --- Day 3: Gear Ratios ---
# You and the Elf eventually reach a gondola lift station; he says the gondola 
# lift will take you up to the water source, but this is as far as he can 
# bring you. You go inside.

# It doesn't take long to find the gondolas, but there seems to be a problem: 
# they're not moving.

# "Aaah!"

# You turn around to see a slightly-greasy Elf with a wrench and a look 
# of surprise. "Sorry, I wasn't expecting anyone! The gondola lift isn't working 
# right now; it'll still be a while before I can fix it." You offer to help.

# The engineer explains that an engine part seems to be missing from the engine, 
# but nobody can figure out which one. If you can add up all the part numbers in 
# the engine schematic, it should be easy to work out which part is missing.

# The engine schematic (your puzzle input) consists of a visual representation of 
# the engine. There are lots of numbers and symbols you don't really understand, 
# but apparently any number adjacent to a symbol, even diagonally, is a 
# "part number" and should be included in your sum. (Periods (.) do not count as 
# a symbol.)

# Here is an example engine schematic:

# 467..114..
# ...*......
# ..35..633.
# ......#...
# 617*......
# .....+.58.
# ..592.....
# ......755.
# ...$.*....
# .664.598..
# In this schematic, two numbers are not part numbers because they are not adjacent 
# to a symbol: 114 (top right) and 58 (middle right). Every other number is 
# adjacent to a symbol and so is a part number; their sum is 4361.

# Of course, the actual engine schematic is much larger. What is the sum of all of 
# the part numbers in the engine schematic?

def part_numbers_sum(str)
  rows = str.split
  sum = 0
  num_builder = ''

  rows.each_with_index do |row, i|
    row.chars.each_with_index do |char, j|
      if char.match?(/[0-9]/)
        num_builder << char
        if j == row.size - 1
          sum += endline_check_and_sum(num_builder, rows, i, j)
          num_builder = ''
        end
      elsif char == '.'
        sum += check_and_sum(num_builder, rows, i, j) unless num_builder.empty?
        num_builder = ''
      else
        sum += num_builder.to_i unless num_builder.empty?
        num_builder = ''
      end
    end
  end

  sum
end

def gear_ratios_sum(str)
  rows = str.split
  sum = 0
  gear_ratios = []

  rows.each_with_index do |row, i|
    row.chars.each_with_index do |char, j|
      if char == '*'
        if rows[i - 1][j].match?(/[0-9]/)
          gear_ratios << rows[i - 1][j - 2, 5].split('.').max.to_i
        else
          gear_ratios << rows[i - 1][j - 3, 3].gsub('.', '').to_i if rows[i - 1][j - 1].match?(/[0-9]/)
          gear_ratios << rows[i - 1][j + 1, 3].gsub('.', '').to_i if rows[i - 1][j + 1].match?(/[0-9]/)
        end

        gear_ratios << rows[i][j - 3, 3].gsub('.', '').to_i if rows[i][j - 1].match?(/[0-9]/)
        gear_ratios << rows[i][j + 1, 3].gsub('.', '').to_i if rows[i][j + 1].match?(/[0-9]/)

        if rows[i + 1][j].match?(/[0-9]/)
          gear_ratios << rows[i + 1][j - 2, 5].split('.').max.to_i
        else
          gear_ratios << rows[i + 1][j - 3, 3].gsub('.', '').to_i if rows[i + 1][j - 1].match?(/[0-9]/)
          gear_ratios << rows[i + 1][j + 1, 3].gsub('.', '').to_i if rows[i + 1][j + 1].match?(/[0-9]/)
        end

        sum += gear_ratios.reduce(:*) if gear_ratios.size == 2
        gear_ratios = []
      end
    end
  end

  sum
end

def check_and_sum(num_builder, rows, i, j)
  part_size = num_builder.size
  adj_chars = ''
  
  adj_chars << rows[i][j - (part_size + 1)] if j - (part_size + 1) >= 0 # left side
  adj_chars << rows[i - 1][j - part_size - 1] if i - 1 >= 0 && j - (part_size - 1) >= 0 # above left
  adj_chars << rows[i - 1][j - part_size, part_size + 1] if i - 1 >= 0 # above & above right
  adj_chars << rows[i + 1][j - (part_size + 1)] if i < rows.size - 1 && j - (part_size + 1) >= 0 # below left
  adj_chars << rows[i + 1][j - part_size, part_size + 1] if i < rows.size - 1 # below & below right

  adj_chars.match?(/[^a-zA-Z0-9.]/) ? num_builder.to_i : 0
end

def endline_check_and_sum(num_builder, rows, i, j)
  part_size = num_builder.size
  adj_chars = ''

  adj_chars << rows[i][j - part_size] # left side
  adj_chars << rows[i - 1][j - part_size, part_size + 1] if i - 1 >= 0 # above left & above
  adj_chars << rows[i + 1][j - part_size, part_size + 1] if i < rows.size - 1 # below left & below

  adj_chars.match?(/[^a-zA-Z0-9.]/) ? num_builder.to_i : 0
end

file_path = File.expand_path("day3_input.txt", __dir__)
input = File.read(file_path)

# puts part_numbers_sum(input)