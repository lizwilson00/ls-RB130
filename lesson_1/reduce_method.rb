# RB130
# Lesson 1
# build a reduce method

# Build a reduce method similar to Enumerable#reduce

# Examples of Enumerable#reduce
# [1, 2, 3].reduce do |acc, num|
#   acc + num
# end

# => 6

# This does not work:
# [1, 2, 3].reduce do |acc, num|
#   acc + num if num.odd?
# end

# => NoMethodError: undefined method `+' for nil:NilClass

# Can also pass in an initial value for the accumulator
# [1, 2, 3].reduce(10) do |acc, num|
#   acc + num
# end

# => 16



def reduce(array, accum_val = nil)
  counter = accum_val ? 0 : 1
  accum = accum_val ? accum_val : array.first

  loop do
    curr_element = array[counter]
    accum = yield(accum, curr_element)
    counter += 1
    break if counter >= array.size
  end
  
  # while counter < array.size
  #   curr_element = array[counter]
  #   accum = yield(accum, curr_element)
  #   counter += 1
  # end

  accum
end

# must be able to call it as follows:
array = [1, 2, 3, 4, 5]

p reduce(array) { |acc, num| acc + num }                    # => 15
p reduce(array, 10) { |acc, num| acc + num }                # => 25
# p reduce(array) { |acc, num| acc + num if num.odd? }        # => NoMethodError: undefined method `+' for nil:NilClass

# additional test cases
p reduce(['a', 'b', 'c']) { |acc, value| acc += value }     # => 'abc'
p reduce([[1, 2], ['a', 'b']]) { |acc, value| acc + value } # => [1, 2, 'a', 'b']