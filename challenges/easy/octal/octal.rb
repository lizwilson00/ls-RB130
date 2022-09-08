# RB130
# Challenges
# Octal

# octal.rb
# problem:
# return the decimal number that is equivalent to the octal number that is passed in
# input: string
# output: integer

# algorithm
# method: to_decimal
# helper method: valid_octal?
# return 0 if the input is invalid
  # if the string contains non-numeric characters
  # if the number is not a valid octal number (number contains 8 or 9)

# initialize a result variable to 0
# split the number into digits, save in an array
# reverse the array
# iterate over the array, from 0 to length of the array - 1, this is the index
# multiply each item in the array by 8 x 10 ^ index
# sum the result of the multiplication, store in result variable
# return the result variable

class Octal
  def initialize(num)
    @num = num
  end

  def to_decimal
    return 0 unless valid_octal?(num)
    result = 0
    octal_arr = num.to_i.digits
    octal_arr.each_with_index do |digit, power|
      result += digit * (8**power)
    end
    result
  end

  private

  attr_reader :num

  def valid_octal?(number)
    number.chars.all? { |digit| digit =~ /[0-7]/ }
  end
end