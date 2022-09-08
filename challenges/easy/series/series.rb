# RB130
# Challenges
# Series

# series.rb

# Problem
# Given a string of digits, return all the possible ordered series
# of a passed in length that can be constructed from that string
# the resulting series must be in the same order as the original string
# passed in max length integer must be greater than 0 and 
# less than or equal to the length of the string
# if it does not meet these parameters then raise an ArgumentError

# Inputs
# string
# integer

# Output
# array of subarrays containing integers

# Examples
# Input string: '01234'
# Input number of digits: 3
# Output: [[0, 1, 2], [1, 2, 3], [2, 3, 4]]

# Input string: '01234'
# Input number of digits: 1
# Output: [[0], [1], [2], [3], [4]]

# Input string: '01234'
# Input number of digits: 5
# Output: [[0, 1, 2, 3, 4]]

# Data Structure
# since the result is an array of subarrays, we will have one array that will store our subarrays
# each subarray will store the series of integers that matches the required criteria

# Algorithm
# class Series
# when a new object is instantiated one argument is passed in
# this is the string of digits, we'll store this in an instance variable

# instance method slices
# this method will take one argument, the number of slices
# check to see if the number of slices > length of the string
  # if it is then raise an ArgumentError
# initialize a results_array to []
# generate the substring series
  # intialize a working_array to []  
  # iterate from index 0 through length of the string - number of slices
    # string[index, num of slices]
    # convert resulting string to an array, save as the working_array
    # map each of the working_array elements so that they are integers
    # add working_array to results_array
# return results_array

class Series
  attr_reader :num_string

  def initialize(num_string)
    @num_string = num_string
  end

  def slices(num_slices)
    raise ArgumentError if num_slices > num_string.length

    results_array = []
    0.upto(num_string.length - num_slices) do |index|
      working_array = num_string[index, num_slices].chars.map(&:to_i)
      results_array << working_array
    end
    results_array
  end
end

series = Series.new('01234')
p series.slices(2)
