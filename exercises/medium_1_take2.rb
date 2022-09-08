# RB130
# Exercises
# Medium 1
# Take 2

# medium_1_take2.rb

# exercise 1
# class Device
#   def initialize
#     @recordings = []
#   end

#   def listen
#     record(yield) if block_given?
#   end

#   def record(recording)
#     @recordings << recording
#   end

#   def play
#     puts @recordings.last
#   end
# end

# listener = Device.new
# listener.listen { "Hello World!" }
# listener.listen
# listener.play # Outputs "Hello World!"

# exercise 2
# class TextAnalyzer
#   def process
#     f = open("sample_text.txt", "r")
#     yield(f.read)
#     f.close
#   end
# end

# analyzer = TextAnalyzer.new
# analyzer.process { |data| puts "#{data.split("\n\n").count } paragraphs" }
# analyzer.process { |data| puts "#{data.split("\n").count } lines" }
# analyzer.process { |data| puts "#{data.split(' ').count } words" }

# sample output
# 3 paragraphs
# 15 lines
# 126 words

# class TextAnalyzer
#   def process
#     f = open("sample_text2.txt", "r")
#     yield(f.read)
#     f.close
#   end
# end

# analyzer = TextAnalyzer.new
# analyzer.process { |data| puts "#{data.split("\n\n").count } paragraphs" }
# analyzer.process { |data| puts "#{data.split("\n").count } lines" }
# analyzer.process { |data| puts "#{data.split(' ').count } words" }

# sample output
# 3 paragraphs
# 19 lines
# 274 words

# exercise 3
# def gather(items)
#   puts "Let's start gathering food."
#   yield(items)
#   puts "Nice selection of food we have gathered!"
# end

# items = ['apples', 'corn', 'cabbage', 'wheat']

# gather(items) { |list| puts list.join(', ') }

# exercise 4
# def sort_birds(array)
#   yield(array)
# end

# birds = %w(raven finch hawk eagle)
# # p birds # => ['raven','finch','hawk','eagle']

# # raven, finch, hawk, eagle = %w(raven finch hawk eagle)
# # p raven # => 'raven'
# # p finch # => 'finch'
# # p hawk # => 'hawk'
# # p eagle # => 'eagle'

# sort_birds(birds) do |_, _, *raptors|
#   puts "Raptors: #{raptors}"
# end

# exercise 5
# items = ['apples', 'corn', 'cabbage', 'wheat']

# def gather(items)
#   puts "Let's start gathering food."
#   yield(items)
#   puts "We've finished gathering!"
# end

# part 1
# gather(items) do |*veggies, grain|
#   puts "#{veggies.join(', ')}"
#   puts grain
# end

# Let's start gathering food.
# apples, corn, cabbage
# wheat
# We've finished gathering!

# part 2
# gather(items) do |fruit, *veggies, grain|
#   puts fruit
#   puts "#{veggies.join(', ')}"
#   puts grain
# end

# Let's start gathering food.
# apples
# corn, cabbage
# wheat
# We've finished gathering!

# part 3
# gather(items) do |fruit, *all_else|
#   puts fruit
#   puts "#{all_else.join(', ')}"
# end

# Let's start gathering food.
# apples
# corn, cabbage, wheat
# We've finished gathering!

# part 4
# gather(items) do |apples, corn, cabbage, wheat|
#   puts "#{apples}, #{corn}, #{cabbage}, and #{wheat}"
# end

# Let's start gathering food.
# apples, corn, cabbage, and wheat
# We've finished gathering!

# def gather(*produce, wheat)
#   puts "Let's start gathering food."
#   p produce
#   puts wheat
#   puts "We've finished gathering!"
# end

# gather(*items)

# exercise 6
# Replace the two `method_name` placeholders with actual method calls
# def convert_to_base_8(n)
#   n.to_s(8).to_i
# end

# Replace `argument` with the correct argument below
# `method` is `Object#method`, not a placeholder
# base8_proc = method(:convert_to_base_8).to_proc

# We'll need a Proc object to make this code work
# Replace `a_proc` with the correct object
# p [8, 10, 12, 14, 16, 33].map(&base8_proc)

# expected return value
# [10, 12, 14, 16, 20, 41]

# exercise 7
# def bubble_sort!(array)
#   loop do
#     swapped = false
#     1.upto(array.size - 1) do |index|
#       if block_given?
#         next if yield(array[index - 1], array[index])
#       else
#         next if array[index - 1] <= array[index]
#       end
#       array[index - 1], array[index] = array[index], array[index - 1]
#       swapped = true
#     end

#     break unless swapped
#   end
#   nil
# end

# array = [5, 3]
# bubble_sort!(array)
# p array == [3, 5]

# array = [5, 3, 7]
# bubble_sort!(array) { |first, second| first >= second }
# p array == [7, 5, 3]

# array = [6, 2, 7, 1, 4]
# bubble_sort!(array)
# p array == [1, 2, 4, 6, 7]

# array = [6, 12, 27, 22, 14]
# bubble_sort!(array) { |first, second| (first % 7) <= (second % 7) }
# p array == [14, 22, 12, 6, 27]

# array = %w(sue Pete alice Tyler rachel Kim bonnie)
# bubble_sort!(array)
# p array == %w(Kim Pete Tyler alice bonnie rachel sue)

# array = %w(sue Pete alice Tyler rachel Kim bonnie)
# bubble_sort!(array) { |first, second| first.downcase <= second.downcase }
# p array == %w(alice bonnie Kim Pete rachel sue Tyler)

# further exploration
def bubble_sort!(array)
  loop do
    swapped = false
    1.upto(array.size - 1) do |index|
      if block_given?
        next if yield(array[index - 1]) <= yield(array[index])
      else
        next if array[index - 1] <= array[index]
      end
      array[index - 1], array[index] = array[index], array[index - 1]
      swapped = true
    end

    break unless swapped
  end
  nil
end

array = %w(sue Pete alice Tyler rachel Kim bonnie)
bubble_sort!(array) { |value| value.downcase }
p array == %w(alice bonnie Kim Pete rachel sue Tyler)