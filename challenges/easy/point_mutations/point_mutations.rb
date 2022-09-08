# RB130
# Challenges
# Point Mutations

# point_mutations.rb

# Problem
# compare two strings of letters, count the number of letters
# that differ in the same indexed position
# if two empty strings are passed in then return 0
# if two differing length strings are passed in then only consider 
# the characters in the longer string that are within the length of 
# the shorter string

# Assumption based on the given test cases
# the letters are all capital letters, no need to be concerned with case

# input: two strings
# output: integer >= 0

# Examples
# string1 = 'ABCDEFG'
# string2 = 'AAA'
# We would only try to match the first 3 characters
# and would return 2 in this case since 'B' and 'C' are not 'A'
# in indexed positions 1 and 2

# DNA.new('ACT').hamming_distance('GGA')
# We would return 3 in this case since all three characters are different

# Data Structure
# can store the strands as strings

# Algorithm
# DNA class
# initialization / constructor
# create a new DNA object
# one string is passed in
# store the string as part of the object, call it strand

# method within the DNA class, called hamming_distance
# method will take a string as an argument, call it test_strand
# compare the passed in test_strand with the calling object's strand
# find the length of both strands, take the minimum of those two numbers,
# call this common_strand_len
# initialize a count to 0
# iterate from 0 to common_strand_len - 1
# compare the values of the object's strand with the passed in strand
# if the values are different then increment the count by 1
# otherwise continue
# return count

class DNA
  attr_reader :strand
  
  def initialize(strand)
    @strand = strand
  end

  def hamming_distance(test_strand)
    max_length = [strand.length, test_strand.length].min
    count = 0
    0.upto(max_length - 1) do |index|
      count += 1 unless strand[index] == test_strand[index]
    end
    
    count
  end
end

