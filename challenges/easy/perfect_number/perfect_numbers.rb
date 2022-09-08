# RB130
# Challenges
# Perfect Number

# perfect_numbers.rb

# Problem
# given a natural number (integer > 0), return its classification
# as a string, either 'abundant', 'deficient', or 'perfect'
# based on the following rules

# Rules
# classification depends on the sum of a number's divisors:
# if the sum is equal the number -> 'perfect' 
# if the sum is less than the number -> 'deficient'
# if the sum is greater than the number -> 'abundant'

# Input: integer
# Output: string

# Examples
# 6 -> 'perfect' 1 + 2 + 3 = 6
# 15 -> 'deficient' 1 + 3 + 5 = 9
# 24 -> 'abundant' 1 + 2 + 3 + 4 + 6 + 8 + 12 = 36
# prime numbers -> 'deficient'

# Data Structure
# divisors of a number will be placed in an array

# Algorithm - High Level (class method classify)
# raise StandardError if number <= 0
# Find the divisors of the number
# Sum the divisors array
# If the sum > number -> abundant
# If the sum == number -> perfect
# If the sum < number -> deficient

# Algorithm - Find the divisors of the number
# initialize an empty array, divisors
# iterate from 1 up to (and including) number / 2 (poss_divisor)
# check to see if the number divided by the poss_divisor has a remainder
# if no remainder then add the number to the divisors array
# return the divisors array

class PerfectNumber
  def self.classify(number)
    raise StandardError if number <= 0
    divisors_sum = sum_divisors(number)
    if divisors_sum > number then 'abundant'
    elsif divisors_sum == number then 'perfect'
    else 'deficient'
    end
  end

  class << self
    private
  
    def sum_divisors(num)
      sum = 0
      1.upto(num/2) do |poss_divisor|
        sum += poss_divisor if num % poss_divisor == 0
      end
      sum
    end
  end
end