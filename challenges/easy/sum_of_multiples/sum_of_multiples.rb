# RB130
# Challenges
# Sum of Multiples

# sum_of_multiples.rb

# Problem:
# Given a positive natural number (an integer greater than zero), call this max number
# sum the multiples of one or more smaller numbers that may be passed in, call these multiples
# as arguments, up to but not including the max number
# If an argument is not given then use 3 and 5 as the multiples
# If the first argument (the "up to" argument) is 1, 2, and 3
# and no multiples are passed in then return 0

# Input: multiples are passed in as arguments (zero, one or more) when a new SumOfMultiples object is instantitated, max num is passed in as an argument to the `to` method
# Output: integer

# Examples:
# No numbers passed in, max num 4, returns 3
# No numbers passed in, max num 10, returns 23 (3 + 6 + 9 + 5)
# Multiples are 7, 13, and 17, max number is 20, returns 51 (7 + 13 + 14 + 17)
# Multiple is 1, max num 2, returns 1
# Multiple is 1, max num 3, returns 2

# Data Structure
# need to be able to accept a variable number of parameters to the `to` class method
# these should be stored in an array
# will need to store which numbers are multiples
# of the multiples in an array

# Algorithm
# initialization
# must be able to handle an unknown number of arguments
# these are the multiples and will be stored in an array

# class method: to 
# no multiples are passed in
# initialize a new SumOfMultiple instance, pass in 3 and 5 as arguments
# and then call the instance method `to` with the same argument that was passed into 
# the class method `to`

# instance method: to
# one argument will be passed to this method (max_num)
# initialize a results_array to store all the multiples
# iterate through the natural numbers
# starting with the lowest multiple
# and ending with the max_num minus 1  
  # check to see if the number is divisible by
  # each multiple
  # if it is divisible by any of the multiples
  # then add the number to the results_array
# return the sum of the results_array

class SumOfMultiples
  attr_reader :mult_array

  def initialize(*numbers)
    @mult_array = numbers.sort
  end

  def self.to(max_num)
    SumOfMultiples.new(3, 5).to(max_num)
  end

  def to(max_num)
    (mult_array.first...max_num).select do |poss_mult|
      num_a_multiple?(poss_mult, mult_array)
    end.sum
  end

  def num_a_multiple?(num, multiple_array)
    multiple_array.any? do |multiple|
      (num % multiple).zero?
    end
  end
end

# p SumOfMultiples.new(5, 6, 8).to(150)

