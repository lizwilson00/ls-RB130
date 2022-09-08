# RB130
# Exercises
# Easy 1

=begin
# problem 2
def compute
  block_given? ? yield : 'Does not compute.'
end

p compute { 5 + 3 } #== 8
p compute { 'a' + 'b' } #== 'ab'
p compute #== 'Does not compute.'

# further exploration
# Modify the compute method so it takes a single argument 
# and yields that argument to the block. 
# Provide at least 3 examples of calling this new version of compute, 
# including a no-block call.

def compute(value)
  block_given? ? yield(value) : 'You forgot to pass in a block'
end

p compute(3) { |num| num ** 2 } #== 9
p compute("liz") { |name| "Hello #{name}!"} #== 'Hello liz!'
p compute("something") #== 'You forgot to pass in a block'
=end

# problem 3
# def missing(array)
#   full_array = (array.first..array.last).to_a
#   full_array - array
# end

# def missing(array)
#   result = []
#   array.each_cons(2) do |first, second|
#     result.concat(((first + 1)..(second - 1)).to_a)
#   end
#   result
# end

# p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
# p missing([1, 2, 3, 4]) == []
# p missing([1, 5]) == [2, 3, 4]
# p missing([6]) == []

# problem 4
# def divisors(num)
#   poss_divisors = (1..num/2).to_a
#   result = poss_divisors.select do |divisor|
#              num % divisor == 0
#            end
#   result.concat([num])
# end

# optimizing
# results = []
# poss divisor = 1
# max divisor = num
# check poss divisor
# use divmod q, r = num.divmod(poss divisor)
# if modulo is 0 then 
  # add poss divisor and the quotient to the results array
  # reassign max divisor = q
# poss divisor += 1
# break if poss_divisor >= max divisor
# return results array uniq

# def divisors(num)
#   result = []
#   poss_divisor = 1
#   max_divisor = num
#   loop do
#     q, r = num.divmod(poss_divisor)
#     if r == 0
#       result.concat([poss_divisor, q])
#       max_divisor = q
#     end
#     poss_divisor += 1
#     break if poss_divisor >= max_divisor
#   end
#   result.uniq.sort
# end

# p divisors(1) #== [1]
# p divisors(7) #== [1, 7]
# p divisors(12) #== [1, 2, 3, 4, 6, 12]
# p divisors(98) #== [1, 2, 7, 14, 49, 98]
# p divisors(99400891) #== [1, 9967, 9973, 99400891] # may take a minute
# p divisors(999962000357)

# problem 5
# high level algorithm
# initialize a constant ALPHABET with all the letters in the alphabet in an array
# initialize a result string, real_name
# iterate over each character in the string
# if character is not a letter then add it to the result string
# otherwise, pass in letter to the decrypt method
# add the returned letter to the result string
# after all characters have been iterated through
# return the result string

# helper method decrypt letter
# pass in an encrypted letter and the decrypted letter is returned
# change the letter to lowercase and store to a new variable, letter_lower
# find the index of the letter by doing a string comparison to ALPHABET
# return the index of the letter
# initialize a new variable decrypted letter as follows:
  # if the index is < 13 then add 13 to the index and find the letter at that new index from ALPHABET
  # else find the letter at index % 13 from ALPHABET
# case must be maintained
# when returning the decrypted letter, check to see if the input letter
# was uppercase and if so, uppercase the returned letter, else lowercase

# ENCRYPTED_PIONEERS = [
# 'Nqn Ybirynpr',
# 'Tenpr Ubccre',
# 'Nqryr Tbyqfgvar',
# 'Nyna Ghevat',
# 'Puneyrf Onoontr',
# 'Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv',
# 'Wbua Ngnanfbss',
# 'Ybvf Unvog',
# 'Pynhqr Funaaba',
# 'Fgrir Wbof',
# 'Ovyy Tngrf',
# 'Gvz Orearef-Yrr',
# 'Fgrir Jbmavnx',
# 'Xbaenq Mhfr',
# 'Fve Nagbal Ubner',
# 'Zneiva Zvafxl',
# 'Lhxvuveb Zngfhzbgb',
# 'Unllvz Fybavzfxv',
# 'Tregehqr Oynapu'
# ]

# def decrypt_pioneers(pioneers_arr)
#   pioneers_arr.map { |pioneer| decrypt_name(pioneer) }
# end

# def decrypt_name(name)
#   real_name = ''
#   name.each_char do |letter|
#     real_name.concat(decrypt_letter(letter))
#   end
#   real_name
# end

# def decrypt_letter(letter)
#   letter_lower = letter.downcase
#   index = ALPHABET.index(letter_lower)
#   decrypted_index = index < 13 ? index + 13 : index % 13
#   decrypted_letter = ALPHABET[decrypted_index]
#   ALPHABET.include?(letter) ? decrypted_letter : decrypted_letter.upcase
# end

# def decrypt_letter(letter)
#   case letter
#   when 'a'..'m', 'A'..'M' then (letter.ord + 13).chr
#   when 'n'..'z', 'N'..'Z' then (letter.ord - 13).chr
#   else                         letter
#   end
# end

# p decrypt_letter('N') == 'A'
# p decrypt_letter('f') == 's'
# p decrypt_letter('B') == 'O'
# p decrypt_letter('v') == 'i'

# p decrypt_name('Nqn Ybirynpr') #== 'Ada Lovelace'
# p decrypt_name('Tenpr Ubccre') #== 'Grace Hopper'
# p decrypt_name('Nqryr Tbyqfgvar')
# p decrypt_name('Nyna Ghevat')
# p decrypt_name('Puneyrf Onoontr')
# p decrypt_name('Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv')

# p decrypt_pioneers(ENCRYPTED_PIONEERS)

# problem 6
# input: array
# output: true or false

# requirements/algorithm
# block will be passed in
# if array is empty then return false
# iterate through each value of the array
# break out of the loop if all items have been processed
# pass in each value to the block
# the return value of the block will be evaluated
# if the return value of the block is true
  # break out of the loop and return true
# else (value is falsey), continue processing the next item in the array


# def any?(array)
#   counter = 0
#   return_val = false
#   while counter < array.length
#     if yield(array[counter]) == true
#       return_val = true
#       break
#     end
#     counter += 1
#   end
#   return_val
# end

# using each
# def any?(array)
#   array.each { |item| return true if yield(item) }
#   false
# end

# p any?({a: 1, b: 2, c: 3}) { |key, value| value < 3 && key == :d }


# p any?([1, 3, 5, 6]) { |value| value.even? } == true
# p any?([1, 3, 5, 7]) { |value| value.even? } == false
# p any?([2, 4, 6, 8]) { |value| value.odd? } == false
# p any?([1, 3, 5, 7]) { |value| value % 5 == 0 } == true
# p any?([1, 3, 5, 7]) { |value| true } == true
# p any?([1, 3, 5, 7]) { |value| false } == false
# p any?([]) { |value| true } == false

# problem 7
# def all?(collection)
#   collection.each { |item| return false unless yield(item) }
#   true
# end

# p all?([1, 3, 5, 6]) { |value| value.odd? } == false
# p all?([1, 3, 5, 7]) { |value| value.odd? } == true
# p all?([2, 4, 6, 8]) { |value| value.even? } == true
# p all?([1, 3, 5, 7]) { |value| value % 5 == 0 } == false
# p all?([1, 3, 5, 7]) { |value| true } == true
# p all?([1, 3, 5, 7]) { |value| false } == false
# p all?([]) { |value| false } == true

# problem 8
# def none?(collection)
#   collection.each { |item| return false if yield(item) }
#   true
# end

# def none?(collection, &block)
#   !any?(collection, &block)
# end

# p none?([1, 3, 5, 6]) { |value| value.even? } == false
# p none?([1, 3, 5, 7]) { |value| value.even? } == true
# p none?([2, 4, 6, 8]) { |value| value.odd? } == true
# p none?([1, 3, 5, 7]) { |value| value % 5 == 0 } == false
# p none?([1, 3, 5, 7]) { |value| true } == false
# p none?([1, 3, 5, 7]) { |value| false } == true
# p none?([]) { |value| true } == true

# problem 9
# iterate through the array
# return true if exactly one of the array items evaluates to true
# based on the logic in the block that was passed in
# return false otherwise
# stop processing (and return false) if a second item in the array
# evaluates to true

# initiate a counter variable to 0
# iterate through each value in the array
  # if the block evaluates to true for a given value, increment the counter
  # else continue
  # break if the counter > 1
# after the iteration is complete,
  # if the counter equals 1 then return true
  # else false

# def one?(array)
#   counter = 0
#   array.each do |item|
#     counter += 1 if yield(item)
#     return false if counter > 1
#   end
#   counter == 1 ? true : false
# end

# another way (misses the requirement to stop processing though)
# def one?(array, &block)
#   array.count(&block) == 1 ? true : false
# end

# solution (using a flag)
# def one?(array)
#   exactly_one = false
#   array.each do |item|
#     next unless yield(item)
#     return false if exactly_one
#     exactly_one = true
#   end
#   exactly_one
# end


# p one?([1, 3, 5, 6]) { |value| value.even? }    # -> true
# p one?([1, 3, 5, 7]) { |value| value.odd? }     # -> false
# p one?([2, 4, 6, 8]) { |value| value.even? }    # -> false
# p one?([1, 3, 5, 7]) { |value| value % 5 == 0 } # -> true
# p one?([1, 3, 5, 7]) { |value| true }           # -> false
# p one?([1, 3, 5, 7]) { |value| false }          # -> false
# p one?([]) { |value| true }                     # -> false

# problem 10
# def count(array)
#   counter = 0
#   array.each { |item| counter += 1 if yield(item) }
#   counter
# end

# def count(array)
#   array.map { |item| yield(item) ? 1 : 0 }.sum
# end

# p count([1,2,3,4,5]) { |value| value.odd? } == 3
# p count([1,2,3,4,5]) { |value| value % 3 == 1 } == 2
# p count([1,2,3,4,5]) { |value| true } == 5
# p count([1,2,3,4,5]) { |value| false } == 0
# p count([]) { |value| value.even? } == 0
# p count(%w(Four score and seven)) { |value| value.size == 5 } == 2

