# RB130
# Challenges
# Medium
# Diamond

# diamond.rb

# Problem
# given one input letter, 
# output a diamond shape of height based on where the letter falls in the alphabet

# Requirements
# If the input letter is 'A' then output 'A'
# the height of the diamond will be the ((index of the letter) * 2) + 1
# the middle row will be the passed in letter output twice with (index of the letter + 1)
# number of spaces in between the two letters
# the first and last rows will be single 'A's with (index of the letter)
# number of spaces to the left and right
# the rows between the first and middle rows will be consecutive letters
# (based on the alphabet) that are set two spaces further apart than the row above them
# The letters appearing on a given row will start with A 
# and increment by row until we reach the passed in letter
# at which point the letters will descend back down to A again
# We are assuming that the passed in character will be an uppercase letter

# Examples
# input letter: 'A'
# A

# input letter: 'D'
#    A
#   B B
#  C   C
# D     D
#  C   C
#   B B
#    A

# Data Structure
# alphabet will be stored in an array so we can easily look up the index of a given letter
# we will build each line using string concatenation
# and then we will add each line to an array
# at the end we will join the array elements together

# Algorithm
# spacing calculations
# max width = (index of the letter in the alphabet (C would be 2)) * 2 + 1
# max leading space = index of the letter in the alphabet

# initialize an array, results_array to []
# iterate from 0 to letter_idx that was passed in, call working index working_idx
# if working_idx == 0 then use first and last line logic
  # first and last line logic ('A' lines)
    # max leading space + letter 'A' + max trailing space (same length as max leading space) 
  # other row logic
      # here we have leading space, the letter, middle space, the letter, trailing space
      # trailing space is the same length as the leading space
      # leading space for a given line ('B' line will be line 1) will be max leading space - line num
      # middle space for a given line is the (line number * 2) - 1
  # add the resulting 'row' to the results_array
# iterate from letter_idx - 1 down to 0, use same logic as outlined above
# join the strings in the results_array with a line break and then add an additional line break at the end
# return the joined strings

# class Line
#   ALPHABET = ('A'..'Z').to_a

#   def initialize(number, letter)
#     @num = number
#     @letter = letter
#     @max_lead_spaces = ALPHABET.find_index(letter)
#   end

#   def single_line
#     case num
#     when 0 then first_and_last_line
#     else default_line
#     end
#   end

#   private

#   attr_reader :num, :max_lead_spaces

#   def first_and_last_line
#     lead_spaces = ' ' * max_lead_spaces
#     "#{lead_spaces}A#{lead_spaces}"
#   end

#   def default_line
#     lead_spaces = ' ' * (max_lead_spaces - num)
#     middle_spaces = ' ' * ((num * 2) - 1)
#     curr_letter = ALPHABET[num]
#     "#{lead_spaces}#{curr_letter}#{middle_spaces}#{curr_letter}#{lead_spaces}"
#   end

# end

# class Diamond
#   ALPHABET = ('A'..'Z').to_a

#   def self.make_diamond(letter)
#     max_line_num = ALPHABET.find_index(letter)
#     result = []
#     0.upto(max_line_num) do |working_idx|
#       result << Line.new(working_idx, letter).single_line
#     end
#     (max_line_num - 1).downto(0) do |working_idx|
#       result << Line.new(working_idx, letter).single_line
#     end
#     result.join("\n") + "\n"
#   end
# end

# puts Diamond.make_diamond('C')

# refactored code after seeing solution
class Line
  ALPHABET = ('A'..'Z').to_a
  
  def initialize(number, letter)
    @num = number
    @letter = letter
    @width = (ALPHABET.find_index(letter) * 2) + 1
  end

  def single_line
    case num
    when 0
      'A'.center(width)
    else
      middle_spaces = ' ' * ((num * 2) - 1)
      curr_letter = ALPHABET[num]
      "#{curr_letter}#{middle_spaces}#{curr_letter}".center(width)
    end
  end

  private

  attr_reader :num, :width
end

class Diamond
  ALPHABET = ('A'..'Z').to_a

  def self.make_diamond(letter)
    max_line_num = ALPHABET.find_index(letter)
    range = (0..max_line_num).to_a + (0...max_line_num).to_a.reverse
    result = []
    range.each do |working_idx|
      result << Line.new(working_idx, letter).single_line
    end
    result.join("\n") + "\n"
  end
end

puts Diamond.make_diamond('D')