# RB130
# Exercises
# easy_2.rb

# exercise 1
# def step(beg_val, end_val, step_val)
#   range = (beg_val..end_val)
#   range_arr = range.to_a
#   range_arr.each do |item|
#     if ((item - range_arr.first) % step_val).zero?
#       yield(item)
#     end
#   end
#   range
# end

# solution
# def step(start_pt, end_pt, increment)
#   curr_val = start_pt
#   loop do
#     yield(curr_val)
#     break if curr_val + increment > end_pt
#     curr_val += increment
#   end
#   start_pt
# end

# step(1, 10, 3) { |value| puts "value = #{value}" }

# value = 1
# value = 4
# value = 7
# value = 10

# exercise 2
# def zip(arr1, arr2)
#   result_array = []
#   arr1.each_with_index do |item, index|
#     result_array << [item, arr2[index]]
#   end
#   result_array
# end

# p zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]

# exercise 3
# def map(array)
#   result_array = []
#   array.each do |item|
#     result_array << yield(item)
#   end
#   result_array
# end

# p map([1, 3, 6]) { |value| value**2 } == [1, 9, 36]
# p map([]) { |value| true } == []
# p map(['a', 'b', 'c', 'd']) { |value| false } == [false, false, false, false]
# p map(['a', 'b', 'c', 'd']) { |value| value.upcase } == ['A', 'B', 'C', 'D']
# p map([1, 3, 4]) { |value| (1..value).to_a } == [[1], [1, 2, 3], [1, 2, 3, 4]]
# p map({a: 1, b: 2, c: 3}) { |_, value| value + 1 }

# exercise 4
# def count(*args)
#   counter = 0
#   args.each do |arg|
#     counter +=1 if yield(arg)
#   end
#   counter
# end

# p count(1, 3, 6) { |value| value.odd? } == 2
# p count(1, 3, 6) { |value| value.even? } == 1
# p count(1, 3, 6) { |value| value > 6 } == 0
# p count(1, 3, 6) { |value| true } == 3
# p count() { |value| true } == 0
# p count(1, 3, 6) { |value| value - 6 } == 3

# exercise 5
# algorithm
# initialize a results_array []
# iterate through each item of the array
# pass the item to the block
  # if the block evaluates to true
    # continue to the next item
  # if the block evaluates to falsey
    # add the current item - end of the array to results_array
    # break out of the loop
# if all items have been checked and all are truthy
# then return an empty array


# def drop_while(array)
#   return_array = []
#   array.each_with_index do |item, index|
#     next if yield(item)
#     return_array = array[index..-1]
#     break
#   end
#   return_array
# end

# def drop_while(array)
#   index = 0
#   while index < array.length && yield(array[index])
#     index += 1
#   end
#   array[index..-1]
# end

# p drop_while([1, 3, 5, 6]) { |value| value.odd? } == [6]
# p drop_while([1, 3, 5, 6]) { |value| value.even? } == [1, 3, 5, 6]
# p drop_while([1, 3, 5, 6]) { |value| true } == []
# p drop_while([1, 3, 5, 6]) { |value| false } == [1, 3, 5, 6]
# p drop_while([1, 3, 5, 6]) { |value| value < 5 } == [5, 6]
# p drop_while([]) { |value| true } == []

# exercise 6
# def each_with_index(array)
#   index = 0
#   array.each do |item|
#     yield(item, index)
#     index += 1
#   end
# end

# result = each_with_index([1, 3, 6]) do |value, index|
#   puts "#{index} -> #{value**index}"
# end

# puts result == [1, 3, 6]

# 0 -> 1
# 1 -> 3
# 2 -> 36
# true

# exercise 7
# def each_with_object(array, collection)
#   array.each do |item|
#     yield(item, collection)
#   end
#   collection
# end

# result = each_with_object([1, 3, 5], []) do |value, list|
#   list << value**2
# end
# p result == [1, 9, 25]

# result = each_with_object([1, 3, 5], []) do |value, list|
#   list << (1..value).to_a
# end
# p result == [[1], [1, 2, 3], [1, 2, 3, 4, 5]]

# result = each_with_object([1, 3, 5], {}) do |value, hash|
#   hash[value] = value**2
# end
# p result == { 1 => 1, 3 => 9, 5 => 25 }

# result = each_with_object([], {}) do |value, hash|
#   hash[value] = value * 2
# end
# p result == {}

# exercise 8
# def max_by(array)
#   max_val = nil
#   max_item = nil
#   array.each do |item|
#     new_val = yield(item)
#     if max_val.nil? || new_val > max_val
#       max_val = new_val
#       max_item = item
#     end
#   end
#   max_item
# end

# p max_by([1, 5, 3]) { |value| value + 2 } == 5
# p max_by([1, 5, 3]) { |value| 9 - value } == 1
# p max_by([1, 5, 3]) { |value| (96 - value).chr } == 1
# p max_by([[1, 2], [3, 4, 5], [6]]) { |value| value.size } == [3, 4, 5]
# p max_by([-7]) { |value| value * 3 } == -7
# p max_by([]) { |value| value + 5 } == nil

# exercise 9
# initialize starting index, index = 0
# iterate through the array, from index up until array length - 1 (not inclusive)
# pass in the array values at index and index + 1 to the block
# return nil

# def each_cons(array)
#   index = 0
#   while index < (array.length - 1)
#     yield(array[index], array[index + 1])
#     index += 1
#   end
#   nil
# end

# hash = {}
# result = each_cons([1, 3, 6, 10]) do |value1, value2|
#   hash[value1] = value2
# end
# p result == nil
# p hash == { 1 => 3, 3 => 6, 6 => 10 }

# hash = {}
# result = each_cons([]) do |value1, value2|
#   hash[value1] = value2
# end
# p hash == {}
# p result == nil

# hash = {}
# result = each_cons(['a', 'b']) do |value1, value2|
#   hash[value1] = value2
# end
# p hash == {'a' => 'b'}
# p result == nil

# exercise 10
# similar to each_cons from exercise 9
# initialize a new variable, argument array []
# pass the number of arguments to the block as is passed in
# by the second argument to the method, n
# start with index = 0
# argument_array = array[index..(n-1)]
# pass in argument_array as arguments to the block
# increment index by 1
# stop when index > array length - n


def each_cons(array, num_items)
  index = 0
  while index < (array.length - num_items + 1)
    yield(*array[index, num_items])
    index += 1
  end
  nil
end

hash = {}
each_cons([1, 3, 6, 10], 1) do |value|
  hash[value] = true
end
p hash == { 1 => true, 3 => true, 6 => true, 10 => true }

hash = {}
each_cons([1, 3, 6, 10], 2) do |value1, value2|
  hash[value1] = value2
end
p hash == { 1 => 3, 3 => 6, 6 => 10 }

hash = {}
each_cons([1, 3, 6, 10], 3) do |value1, *values|
  hash[value1] = values
end
p hash == { 1 => [3, 6], 3 => [6, 10] }

hash = {}
each_cons([1, 3, 6, 10], 4) do |value1, *values|
  hash[value1] = values
end
p hash == { 1 => [3, 6, 10] }

hash = {}
each_cons([1, 3, 6, 10], 5) do |value1, *values|
  hash[value1] = values
end
p hash == {}