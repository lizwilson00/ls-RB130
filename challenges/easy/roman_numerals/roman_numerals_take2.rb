# RB130
# Challenges
# Easy
# Take 2
# Roman Numerals

# roman_numerals_take2.rb

# Problem
# given an integer, convert to roman numerals, up to a maximum of 3000

# Examples
# 1 => 'I'
# 4 => 'IV'
# 9 => 'IX'
# 40 => 'XL'
# 93 => 'XCIII'
# 1824 => 'MDCCCXXIV'
  # for each 1000 we add an 'M' (1)
  # number is now 824
  # for each 500 we add a 'D' (1)
  # number is now 324
  # for each 100 we add a 'C' (3)
  # number is now 24
  # for each 10 we add an 'X' (2)
  # for each 4 we add an 'IV' (1)
# 3000 => 'MMM'
  # for each 1000 we want to take one 'M' and add it to the result string

# Roman Numerals to integer conversion
# 'I' => 1
# 'V' => 5
# 'X' => 10
# 'L' => 50
# 'C' => 100
# 'D' => 500
# 'M' => 1000

# Reversing the order and adding in 4s and 9s
# 1000 => 'M'
# 900 => 'CM'
# 500 => 'D'
# 400 => 'CD'
# 100 => 'C'
# 90 => 'XC'
# 50 => 'L'
# 40 => 'XL'
# 10 => 'X'
# 9 => 'IX'
# 5 => 'V'
# 4 => 'IV'
# 1 => 'I'

# Data structure
# mapping will be stored as a constant ROMAN_NUMERALS

# Algorithm
# take the keys of ROMAN_NUMERALS and sort descending
# iterate through the keys of the array
# initialize a new local variable result = ''
# initialize a new local variable number = the number passed in
# divide the number by the each key, in succession
  # if > 0
    # Add the number of ROMAN_NUMERALS corresponding with that number
    # number then becomes the remainder of that division
# return result

class RomanNumeral
  ROMAN_NUMERALS = { 
    1000 => 'M',
    900 => 'CM',
    500 => 'D',
    400 => 'CD',
    100 => 'C',
    90 => 'XC',
    50 => 'L',
    40 => 'XL',
    10 => 'X',
    9 => 'IX',
    5 => 'V',
    4 => 'IV',
    1 => 'I' }
  
  attr_reader :num

  def initialize(num)
    @num = num
  end

  def to_roman
    number = num
    roman_num = ''
    ROMAN_NUMERALS.keys.sort { |a, b| b <=> a }.each do |int|
      result, remainder = number.divmod(int)
      if result > 0
        result.times { roman_num << ROMAN_NUMERALS[int] }
        number = remainder
      end
    end
    roman_num
  end
end
