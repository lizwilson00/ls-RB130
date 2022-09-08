# RB130
# Challenges
# Easy
# Take 2
# Triangles

# triangles_test_take2.rb

# Problem/Requirements:
# given the three dimensions of a triangle, return the type of triangle
# the dimensions will be passed in as integers during Triangle object instantiation
# For a shape to be a triangle the following must be met:
  # All sides must be of length > 0 
  # AND
  # The sum of the lengths of any two sides must be greater than the length of the third side
# Present an ArgumentError if any of the above conditions are met

# Data Structure
# may be helpful to convert the three sides into an array for easier analysis/manipulation

# Algorithm
# valid? method
# passes in an array of 3 numbers (representing the lengths of the sides)
# returns whether or not the triangle is valid
# returns false if any of the sides are <= 0
# sorts the sides, sums the first two elements, if this sum is <= third element then return false
# else return true

# Triangle initialization
# store the 3 sides as an array in an instance variable called sides
# raise an ArgumentError if valid? comes back as false

# kind method
# if the 3 sides are equal then return 'equilateral'
# if 2 of the 3 sides are equal then return 'isosceles'
# else return 'scalene'

class Triangle
  attr_reader :sides
  
  def initialize(side1, side2, side3)
    @sides = [side1, side2, side3]

    raise ArgumentError unless valid?(sides)
  end

  def valid?(side_array)
    return false if side_array.any? { |side| side <= 0 }
    
    sorted_sides = side_array.sort
    return false if sorted_sides[0, 2].sum <= sorted_sides.last

    true
  end

  def kind
    if sides.uniq.size == 1      then 'equilateral'
    elsif sides.uniq.size == 2   then 'isosceles'
    else                              'scalene'
    end
  end
end

