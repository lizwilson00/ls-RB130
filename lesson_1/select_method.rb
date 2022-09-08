# RB130
# Lesson 1
# build a select method

# Write a select method that mirrors the behavior of Array#select
# Array#select takes a block and then yields each element to the block
# If the block evaluates to true, the current element will be included in the returned array
# If the block evaluates to false, the current element will not be included

# examples of the Array#select method:
# array = [1, 2, 3, 4, 5]

# array.select { |num| num.odd? }       # => [1, 3, 5]
# array.select { |num| puts num }       # => [], because "puts num" returns nil and evaluates to false
# array.select { |num| num + 1 }        # => [1, 2, 3, 4, 5], because "num + 1" evaluates to true

def select(array)
  counter = 0
  results_array = []

  while counter < array.size
    curr_element = array[counter]
    results_array << curr_element if yield(curr_element)
    counter += 1
  end

  results_array
end

array = [1, 2, 3, 4, 5]

# p select(array) { |num| num.odd? }      # => [1, 3, 5]
# p select(array) { |num| puts num }      # => [], because "puts num" returns nil and evaluates to false
# p select(array) { |num| num + 1 }       # => [1, 2, 3, 4, 5], because "num + 1" evaluates to true