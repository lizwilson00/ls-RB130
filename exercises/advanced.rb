# RB130
# Exercises
# Advanced 1

# advanced.rb

# exercise 1
# In this exercise, your task is to create a new Enumerator object. 
# When creating a new Enumerator, you may define what values are iterated upon. 
# We'll want to create an Enumerator that can iterate over an infinite list of factorials. 
# Once you make this new Enumerator, test it out by printing out the first 7 factorial values, starting with zero factorial.

# More specifically, print the first 7 factorials by using an "External Iterator". 
# Once you have done so, see what happens if you print 3 more factorials (the results won't be correct). 
# Now, reset your Enumerator (use the rewind method). 
# Finally, print 7 more factorials.

# factorial = Enumerator.new do |yielder|
#   accumulator = 1
#   num = 0
#   loop do
#     accumulator = num.zero? ? 1 : accumulator * num
#     yielder << accumulator
#     num += 1
#   end
# end

# # External iterators

# 6.times { |number| puts "#{number}! == #{factorial.next}" }
# puts "=========================="
# 6.times { |number| puts "#{number}! == #{factorial.next}" }
# puts "=========================="
# factorial.rewind
# 6.times { |number| puts "#{number}! == #{factorial.next}" }
# puts "=========================="

# # Internal iterators

# factorial.each_with_index do |value, number|
#   puts "#{number}! == #{value}"
#   break if number >= 5
# end

# exercise 2
# Group 1
# my_proc = proc { |thing| puts "This is a #{thing}." }
# puts my_proc
# puts my_proc.class
# my_proc.call
# my_proc.call('cat')

# With a proc, you can pass in the wrong number of arguments
# and it will still run.
# Here, when we call my_proc without passing in an argument
# it still runs but the output is nil where the argument
# string would normally appear.
# nil is assigned to the block variable.
# You can create a proc object with a call of proc instead of Proc.new
# A Proc object is of class Proc

# Group 2
my_lambda = lambda { |thing| puts "This is a #{thing}." }
my_second_lambda = -> (thing) { puts "This is a #{thing}." }
puts my_lambda
puts my_second_lambda
puts my_lambda.class
my_lambda.call('dog')
my_lambda.call
my_third_lambda = Lambda.new { |thing| puts "This is a #{thing}." }
# It appears that lambda is a subclass or subtype of Proc
# You can define a lambda in 2 ways:
# 1. Similar to a proc (with the word lambda in front of the block)
# - or -
# 2. With -> and the parameter name in parentheses prior to the block
# - or -
# You cannot define a lambda object with Lambda.new in front of the block
# This will cause a NameError
# The class of these objects is Proc, NOT Lambda
# Lambda objects have strict arity and therefore will throw an 
# error if called without the exact number of required arguments
# In this case when we call my_lamba without an argument
# we see an ArgumentError


# Group 3
# def block_method_1(animal)
#   yield
# end

# block_method_1('seal') { |seal| puts "This is a #{seal}."}
# block_method_1('seal')
# Here we are yielding to the optional block
# This demonstrates that blocks have lenient arity in that
# the yield is not passing in an argument to the block
# but the block is able to run successfully without the argument
# It outputs nil instead of a value.
# This example also demonstrates a limitation of the yield keyword:
# If a block is not passed in and yield is called then a LocalJumpError will occur

# Group 4
def block_method_2(animal)
  yield(animal)
end

block_method_2('turtle') { |turtle| puts "This is a #{turtle}."}
block_method_2('turtle') do |turtle, seal|
  puts "This is a #{turtle} and a #{seal}."
end
block_method_2('turtle') { puts "This is a #{animal}."}
# In the first call to block_method_2, we are passing in the required
# argument to the method.  The keyword yield is passing the argument
# animal to the block.  The block is then including the argument as
# part of the string output.
# In the second call to block_method_2, this demonstrates that blocks 
# have lenient arity in that the yield keyword is only passing in one 
# argument to the block even though the block is set up to accept two
# arguments.  The argument is assigned to the first local variable and nil 
# is assigned to the second local variable.  This is why we see that the output
# includes the first local variable but not the second.
# In the third call to block_method_2, this demonstrates that variables
# that are initialized within a method definition are not accessible
# outside of that method definition (animal in this case).  The block
# cannot access the local variable animal and therefore a NameError is thrown.
# The variable animal is outside of the block's scope.