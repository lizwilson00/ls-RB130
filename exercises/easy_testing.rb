# RB130
# Exercises
# Easy Testing
require 'minitest/autorun'
# require "minitest/reporters"
# Minitest::Reporters.use!

# exercise 1
# Write a minitest assertion that will fail if the value.odd? is not true.
# class OddTest < MiniTest::Test
#   def setup
#     @value = 3
#   end
  
#   def test_value_is_odd
#     assert_equal(true, @value.odd?)
#   end
# end

# exercise 2
# write a minitest assertion that will fail if value.downcase does not return 'xyz'
# class ValueTest < MiniTest::Test
#   def setup
#     @value = 'XYZ'
#   end
  
#   def test_downcase
#     assert_equal('xyz', @value.downcase)
#   end
# end

# exercise 3
# Write a minitest assertion that will fail if value is not nil.
# class ValueTest < MiniTest::Test
#   def setup
#     @value = nil
#   end
  
#   def test_nil
#     assert_nil(@value)
#   end
# end

# exercise 4
# Write a minitest assertion that will fail if the Array list is not empty.
# class ListTest < MiniTest::Test
#   def setup
#     @list = []
#   end
  
#   def test_empty
#     assert_empty(@list)
#   end
# end

# exercise 5
# Write a minitest assertion that will fail if the 'xyz' is not in the Array list.
# class ListTest < MiniTest::Test
#   def setup
#     @list = ['xyz']
#   end
  
#   def test_includes
#     assert_includes(@list, 'xyz')
#   end
# end

# exercise 6
# Write a minitest assertion that will fail unless employee.hire raises a NoExperienceError exception.
# class NoExperienceError < StandardError; end

# class Employee
#   def hire(name)
#     raise NoExperienceError, "Name must be entered!" if name == 'none'
#   end
# end

# class EmployeeTest < MiniTest::Test
#   def setup
#     @employee = Employee.new
#   end
  
#   def test_error
#     assert_raises(NoExperienceError) do
#       @employee.hire('none')
#     end
#   end
# end

# exercise 7
# Write a minitest assertion that will fail if value 
# is not an instance of the Numeric class exactly. 
# value may not be an instance of one of Numeric's superclasses.

# class ClassTest < MiniTest::Test
#   def setup
#     @value = Numeric.new
#   end
  
#   def test_class
#     assert_instance_of(Numeric, @value)
#   end
# end

# exercise 8
# Write a minitest assertion that will fail 
# if the class of value is not Numeric or one 
# of Numeric's subclasses (e.g., Integer, Float, etc).
# class ClassTest < MiniTest::Test
#   def setup
#     @value = 3.0
#   end
  
#   def test_subclass
#     assert_kind_of(Numeric, @value)
#   end
# end

# exercise 9
# Write a test that will fail if list and 
# the return value of list.process are different objects.
# assert_same(list, list.process)

# exercise 10
# Write a test that will fail if 'xyz' is one of the elements in the Array list:
refute_includes(list, 'xyz')
