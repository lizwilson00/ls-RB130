# RB130
# Challenges
# Triangles

#triangles.rb

class Triangle
  attr_reader :side1, :side2, :side3

  def initialize(side1, side2, side3)
    @side1 = side1
    @side2 = side2
    @side3 = side3

    raise ArgumentError unless valid?
  end
  
  def valid?
    tri_arr_sort = [side1, side2, side3].sort
    largest_side = tri_arr_sort.last
    !(tri_arr_sort[0..1].sum <= largest_side || tri_arr_sort.first <= 0)
  end
  
  def kind
    if side1 == side2 && side2 == side3
      'equilateral'
    elsif side1 == side2 || side2 == side3 || side1 == side3
      'isosceles'
    else
      'scalene'
    end
  end
end

# scalene_test = Triangle.new(10, 11, 12)
# zeros = Triangle.new(0, 0, 0)
# p scalene_test.kind
