# RB130
# Challenges
# Triangles

# Problem:
# determine whether a triangle is equilateral, isosceles, or scalene
# equilateral: sides are all the same length
# isosceles: exactly two sides are the same length
# scalene: sides of differing lengths
# invalid triangle: 
  # one or more sides have a length of <= 0
  # sum of the lengths of any two sides <= length of the third side

# Requirements
# input: three numbers
# output: one of three strings when the method kind is called on the triangle object
# use the logic listed above
  # equilateral
  # isosceles
  # scalene
# when the triangle object is being instantiated
# return an ArgumentError if the sides meet the invalid criteria (above)

# Examples:
# invalid - sides less than or equal to 0
# Triangle.new(0, 0, 0)
# invalid - sum of two sides less than or equal to third side
# Triangle.new(1, 1, 3)
# equilateral
# Triangle.new(10, 10, 10).kind
# isosceles
# Triangle.new(3, 4, 4).kind
# scalene
# Triangle.new(3, 4, 5).kind

# Data Structure
# save the sides to an array in order to apply logic easier

# Algorithm
# During object initialization, call a method to check whether the sides are valid
  # store the sides in an array, sides_array
  # sort the sides_array (smallest side first)
  # if any of the objects in the sides_array <= 0 then present ArgumentError
  # if the sum of the first two objects in the sides_array <= last object in the sides array
  # then present ArgumentError
# Create a kind method
  # If the sides all equal one another then return 'equilateral'
  # If two of the sides are the same then return 'isosceles' (s1 == s2 or s2 == s3 or s1 == s3)
  # Else return 'scalene'

class Triangle
  attr_reader :sides

  def initialize(side1, side2, side3)
    @sides = [side1, side2, side3]

    raise ArgumentError if invalid?
  end

  def kind
    if sides.uniq.size == 1
      'equilateral'
    elsif sides.uniq.size == 2
      'isosceles'
    else
      'scalene'
    end
  end

  private
  
  def invalid?
    sides_sorted = sides.sort
    sides_sorted.first <= 0 || sides_sorted[0..1].sum <= sides_sorted.last
  end
end