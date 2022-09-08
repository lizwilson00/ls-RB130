# RB130
# Challenges
# Roman Numerals

# roman_numerals.rb
# Problem
# given an integer 3000 or below, convert to a roman numeral
# input: integer
# output: string

# Examples
# 27 -> 'XXVII'
# 48 -> 'XLVIII'
# 93 -> 'XCIII'
# 101 -> 'CI'

# Rules
# Cannot increment another I to get 4
# Must subtract from 5 (I goes in front of V)
# Cannot increment another I to get 9
# Must subtract from 10 (I goes in front of X)

# Data Structure
# split the integer into an array of digits
# Ex: 1048, [1, 0, 4, 8]

# roman_num_lookup
# array of "ones place"
# 1 => ['I', 'II', 'III', 'IV', 'V', 'VI', 'VII', 'VIII', 'XI']
# array of the "tens place"
# 2 => ['X', 'XX', 'XXX', 'XL', 'L', 'LX', 'LXX', 'LXXX', 'XC']
# array of the "hundredths place"
# 3 => ['C', 'CC', 'CCC', 'CD', 'D', 'DC', 'DCC', 'DCCC', 'CM']
# array of the "thousandths place"
# 4 => ['M', 'MM', 'MMM']

# Algorithm
# constructor
# split the passed in integer into its constituent digits, save as an array, num_array

# method to_roman
# initialize a new array variable roman_numeral to []

# find the length of the array, num_array_len
# iterate through the array from 0 to length - 1 
# using the appropriate lookup array to find the corresponding roman numeral
# use the digit in the (num_array - 1) to find the correct roman numeral
# example if the digit is 1 in the num_array, lookup the value in the lookup
# table using 0
# once we have the correct roman numeral we add it to the roman_numeral array
# once we are finished iterating we join roman_numeral into a string and return

# logic for which lookup table to use
# length - index = 4 -> use thousandths
# length - index = 3 -> use hundredths
# length - index = 2 -> use tens
# length - index = 1 -> use ones

# Examples
# length = 4, index 0 -> thousandths place lookup 
# length = 4, index 1 -> hundredths place lookup
# length = 4, index 2 -> tens place lookup
# length = 4, index 3 -> ones place lookup

# length = 3, index 0 -> hundredths place lookup
# length = 3, index 1 -> tens place lookup

class RomanNumeral
  ROMAN_NUMERAL_LOOKUP = {
    1 => ['I', 'II', 'III', 'IV', 'V', 'VI', 'VII', 'VIII', 'IX'],
    2 => ['X', 'XX', 'XXX', 'XL', 'L', 'LX', 'LXX', 'LXXX', 'XC'],
    3 => ['C', 'CC', 'CCC', 'CD', 'D', 'DC', 'DCC', 'DCCC', 'CM'],
    4 => ['M', 'MM', 'MMM'] }
    

  def initialize(integer)
    @num_array = integer.to_s.chars.map { |char| char.to_i }
  end

  def to_roman
    roman_numeral = []
    num_array_len = num_array.length
    0.upto(num_array_len - 1) do |index|
      next if num_array[index].zero?
      
      roman_numeral << ROMAN_NUMERAL_LOOKUP[num_array_len - index][num_array[index] - 1]
    end
    roman_numeral.join
  end

  private

  attr_reader :num_array
end