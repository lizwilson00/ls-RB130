# RB130
# Challenges
# Easy
# Take 2
# Point Mutations

# point_mutations_take2.rb

# Problem
# given two strings, return the number of character differences between them
# one string will be passed in during DNA object instantiation
# and the second string will be passed in to the hamming_distance method
# if both strings are empty then return 0
# if one string is longer than the other, only compare the characters until 
# the end of the shorter string

# Data Structure
# it may be easier to do the pairwise comparisons if both strings were split
# into their component characters and saved to arrays (not necessarily)

# Algorithm
# DNA initialization
# one string will be passed in, save as an instance variable

# hamming_distance method
# find the length of the shorter string
# initialize a local variable count to 0
# iterate from 0 to the length of the shorter string - 1
  # if the first character of the calling object is the same as the other object then increase count by 1
  # else, continue
# return count

class DNA
  attr_reader :strand

  def initialize(strand)
    @strand = strand
  end

  def hamming_distance(other_strand)
    common_strand_len = [strand.size, other_strand.size].min
    count = 0
    common_strand_len.times do |index|
      count += 1 unless strand[index] == other_strand[index]
    end
    count
  end
end
