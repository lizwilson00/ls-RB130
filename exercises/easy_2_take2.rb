# RB130
# Exercises
# Easy 2
# Take 2

# easy_2_take2.rb

# exercise 1
# def step(st_val, end_val, incr)
#   curr_val = st_val
#   while curr_val <= end_val
#     yield(curr_val)
#     curr_val += incr
#   end
#   curr_val - incr
# end

# def step(st_val, end_val, incr)
#   curr_val = st_val
#   loop do
#     yield(curr_val)
#     break if curr_val + incr > end_val
#     curr_val += incr
#   end
#   curr_val
# end

# p step(1, 10, 3) { |value| puts "value = #{value}" }

# exercise 2
# write your own #zip method, similar to the Array#zip method
# assume that the two arrays are the same size

# def zip(array)
#   result_array = []
#   (array.size - 1).times do |index|
#     result_array << [self[index], array[index]]
#   end
#   result_array
# end

# def zip(array)
#   array.each_with_index.with_object([]) do |(element, index), result|
#     result << [self[index], element]
#   end
# end

# p [1, 2, 3].zip([4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]

# exercise 3
# def map(array)
#   array.each_with_object([]) { |item, result| result << yield(item) }
# end

# p map([1, 3, 6]) { |value| value**2 } == [1, 9, 36]
# p map([]) { |value| true } == []
# p map(['a', 'b', 'c', 'd']) { |value| false } == [false, false, false, false]
# p map(['a', 'b', 'c', 'd']) { |value| value.upcase } == ['A', 'B', 'C', 'D']
# p map([1, 3, 4]) { |value| (1..value).to_a } == [[1], [1, 2, 3], [1, 2, 3, 4]]

# exercise 4
# def count(*args)
#   sum = 0
#   args.each { |item| sum += 1 if yield(item) }
#   sum
# end

# p count(1, 3, 6) { |value| value.odd? } == 2
# p count(1, 3, 6) { |value| value.even? } == 1
# p count(1, 3, 6) { |value| value > 6 } == 0
# p count(1, 3, 6) { |value| true } == 3
# p count() { |value| true } == 0
# p count(1, 3, 6) { |value| value - 6 } == 3

# exercise 5
# write a method that works similarly to the Enumerable#drop_while method
# def drop_while(array)
#   result_array = []
#   array.each_with_index do |item, index|
#     unless yield(item)
#       result_array = array[index..-1]
#       break
#     end
#   end
#   result_array
# end

# using a while loop
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
# write an each_with_index method
# def each_with_index(array)
#   array.size.times do |index|
#     yield(array[index], index)
#   end
#   array
# end

# using each
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

# exercise 7
# write an #each_with_object method

# def each_with_object(array, obj)
#   array.each do |item|
#     yield(item, obj)
#   end
#   obj
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
# write a #max_by method
# def max_by(array)
#   max_obj = nil
#   max_val = nil
#   array.each do |item|
#     curr_val = yield(item)
#     if max_val.nil? || curr_val > max_val
#       max_val = curr_val
#       max_obj = item
#     end
#   end
#   max_obj
# end

# p max_by([1, 5, 3]) { |value| value + 2 } == 5
# p max_by([1, 5, 3]) { |value| 9 - value } == 1
# p max_by([1, 5, 3]) { |value| (96 - value).chr } == 1
# p max_by([[1, 2], [3, 4, 5], [6]]) { |value| value.size } == [3, 4, 5]
# p max_by([-7]) { |value| value * 3 } == -7
# p max_by([]) { |value| value + 5 } == nil

# exercise 9
# write a method #each_cons where it always looks at pairwise elements
# returns nil

# def each_cons(collection)
#   index = 0
#   while index < collection.size - 1
#     yield(collection[index], collection[index + 1])
#     index += 1
#   end
#   nil
# end

# using #each_with_index
# def each_cons(collection)
#   collection.each_with_index do |item, index|
#     break if index > collection.size - 2
#     yield(item, collection[index + 1])
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
# write an #each_cons method that allows for the number of 
# elements to be passed in as an extra parameter

def each_cons(collection, num)
  index = 0
  while index <= collection.size - num
    arguments = collection[index, num]
    yield(*arguments)
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