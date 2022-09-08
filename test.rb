# def echo(str)
#   str
# end

# echo                                          # => ArgumentError: wrong number of arguments (0 for 1)
# echo("hello!")                                # => "hello!"
# echo("hello", "world!")                       # => ArgumentError: wrong number of arguments (2 for 1)

# this time, called with an implicit block
# echo { puts "world" }                         # => ArgumentError: wrong number of arguments (0 for 1)
# echo("hello!") { puts "world" }               # => "hello!"
# echo("hello", "world!") { puts "world" }      # => ArgumentError: wrong number of arguments (2 for 1)


# # method implementation
# def increment(number)
#   if block_given?
#     yield(number + 1)
#   end
#   number + 1
# end

# # method invocation
# test = increment(5) do |num|
#   puts num
# end

# puts test

# def compare(str)
#   puts "Before: #{str}"
#   after = yield(str)
#   puts "After: #{after}"
# end

# # method invocation
# compare('hello') { |word| puts word.upcase! }

# def call_me(some_code)
#   some_code.call
# end

# # name = "Robert"
# chunk_of_code = Proc.new {puts "hi #{name}"}
# name = "Griffin III"        # re-assign name after Proc initialization

# call_me(chunk_of_code)

# def test(&block)
# 	puts "What's &block? #{block}"
# end

# test { sleep(1) }

# def test2(block)
#   puts "hello"
#   block.call          # calls the block that was originally passed to test()
#   puts "good-bye"
# end

# def test(&block)
#   puts "1"
#   test2(block)
#   puts "2"
# end

# test { |prefix| puts "xyz" }
# => 1
# => hello
# => xyz
# => good-bye
# => 2

# a = 1
# b = 2

# my_proc = Proc.new { p local_variables }

# c = 3

# my_proc.call # => [:my_proc, :b, :a, .....] # ignore everything after a

# p local_variables # => [:c, :my_proc, :b, :a, .....] # ignore everything after a

# def welcome(str)
#   # puts "#{str} #{yield}"
#   # puts str + ' ' + yield
#   # puts str + ' ' + (block_given? ? yield : '')
#   puts str + ' ' + block.call
# end

# welcome('Hello') { 'there' } # => Hello there
# welcome('Hey') { 'Joe' } # => Hey Joe

# def echo_with_yield(str)
#   p block_given?
#   yield
#   str
# end

# echo_with_yield("hello!")

# def call_chunk(code_chunk)
#   code_chunk.call
# end

# color = "blue"
# say_color = Proc.new {puts "The color is #{color}"}

# call_chunk(say_color)

# p [2, 3, 5].inject(1, &:+)
# p [2, 3, 5].inject(1, :+)
# p [2, 3, 5].inject { |total, num| total + num }
# p [2, 3, 5].inject { |total, num| num + num }
# p [2, 3, 5].inject(1) { |total, num| num + num }
# p [2, 3, 5].inject(1) { |total, num| total + num }

# class Demo
#   def initialize(n)
#     @iv = n
#   end
#   def hello()
#     "Hello, #{name}, @iv = #{@iv}"
#   end
# end

# k = Demo.new(99)
# m = k.method(:hello)
# m.call   #=> "Hello, @iv = 99"

# name = "Lizzie"

# def how_are_you
# 	"How are you?"
# end

# 2.times do
# 	greeting = "Hello"	
# 	puts "#{greeting} #{name}"
# 	puts how_are_you
# end

# name = "Liz"

# def hello(greeting)
# 	greeting.call
# end

# name = "Liz"
# name_greeting = Proc.new { puts "Hello #{name}" }
# name = "Lizzie"

# hello(name_greeting)

# def greeting
# 	yield
# end

# greeting { puts "Hello Liz" }

# def greeting(message)
# 	message.call
# end

# hello_name = Proc.new { puts "Hello Liz" }

# greeting(hello_name)

# Output:
# Hello Liz

# def test(&block)
#   puts "What's &block? #{block}"
# end

# test # { sleep(1) }

# def test2(block)
#   puts "hello"
#   block.call          # calls the block that was originally passed to test()
#   puts "good-bye"
# end

# def test(&block)
#   puts "1"
#   test2(block)
#   puts "2"
# end

# test { puts "xyz" }

# def conversation(&block)
# 	puts "Greeting: Hello"
# 	block.call("Response: ") # block has been converted to a `proc`
# end

# conversation { |prefix| puts prefix + "Hi" }

# Output:
# Greeting: Hello
# Response: Hi

# def convert(string)
# 	yield(string)
# end

# string = "2"
# a_proc = :to_i.to_proc
# p a_proc
# p convert(string, &a_proc) # => 2

# def time_it
#   time_before = Time.now
#   # do something
#   time_after= Time.now

#   puts "It took #{time_after - time_before} seconds."
# end

# time_it { 100.times { (1..1000).to_a.count } }

# def b
# 	1
# end
# my_proc_2 = Proc.new { puts B }

# B = 2
# my_proc_2.call # => ERROR

# without blocks
# def change_string(string, change)
# 	puts "Before: #{string}"
# 	str_after = case change
# 							when :all_caps then string.upcase
# 							when :down then string.downcase
# 							when :capital then string.capitalize
# 							end
# 	puts "After: #{str_after}"
# end

# change_string("hello", :all_caps) 
# Before: "hello"
# After: "HELLO"

# with blocks
# def change_string(string)
# 	puts "Before: #{string}"
# 	str_after = yield(string)
# 	puts "After: #{str_after}"
# end

# change_string("hello") { |str| str.upcase } 
# # Before: "hello"
# # After: "HELLO"
# # allows the method caller to do something the method implementor may not have expected
# change_string("2") { |str| str.to_i } # => 2
# Before: "2"
# After: 2

# def time_it
#   time_before = Time.now
#   # do something
#   time_after= Time.now

#   puts "It took #{time_after - time_before} seconds."
# end

# time_it { 100.times { (1..1000).to_a.count } } # => It took 6.0e-07 seconds.

# arr = [1, 2, 3, 4, 5]

# p arr.map(&:to_s) # specifically `&:to_s`

# arr = [1, 2, 3, 4, 5]

# p arr.map { |elem| elem.to_s }

# def call_this
#   yield(2)
# end

# # your code here
# to_s = Proc.new { |elem| elem }
# to_i = Proc.new { |elem| elem.to_s }

# p call_this(&to_s) # => returns 2
# p call_this(&to_i) # => returns "2"

# def block_method(animal)
#   yield(animal)
# end

# block_method('turtle') do |turtle, seal|
#   puts "This is a #{turtle} and a #{seal}."
# end

# block_method('turtle') { |animal| puts "This is a #{animal}." }

def some_method(block)
  block_given?
end

bloc = Proc.new { puts "hi" }

p some_method('test', &bloc)