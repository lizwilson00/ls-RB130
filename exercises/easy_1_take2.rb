# RB130
# Exercises
# Easy 1
# Take 2

# exercise 2
# def compute(first_arg)
#   block_given? ? yield(first_arg) : 'Does not compute.'
# end

# p compute { 5 + 3 } == 8
# p compute { 'a' + 'b' } == 'ab'
# p compute == 'Does not compute.'
# p compute(5) { |first| first + 3 } == 8
# p compute('a') { |first| first + 'b' } == 'ab'
# p compute('?') == 'Does not compute.'

# exercise 3
# problem:
# return an array with the integers that are missing 
# from a sorted array that is passed in
# if there are no missing integers or if the array only contains one element
# then return an empty array

# Algorithm:
# generate an array of the sequence of the full array based on what was passed in
# use the first and last elements from the array that was passed in
# find the difference between this "full" array and the array that was passed in
# return the array of differences

# def missing(missing_elements)
#   full_array = (missing_elements.first..missing_elements.last).to_a
#   full_array.difference(missing_elements)
# end

# p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
# p missing([1, 2, 3, 4]) == []
# p missing([1, 5]) == [2, 3, 4]
# p missing([6]) == []

# exercise 4
# Problem:
# given an integer, return all the possible divisors for that integer in an array

# Algorithm:
# return [1] if num == 1
# initialize a results_array = []
# initialize a variable max_poss_divisor to num
# set poss_divisor to 1
# while poss_divisor < max_poss_divisor
  # find the quotient and remainder of num / poss_divisor
    # if remainder is zero:
      # add the poss_divisor and the quotient to result array
      # reassign max_poss_divisor to the quotient
    # else poss_divisor += 1
# return results_array

# def divisors(num)
#   return [1] if num == 1
#   results_array = []
#   max_poss_divisor = num
#   poss_divisor = 1
#   while poss_divisor < max_poss_divisor
#     quotient, remainder = num.divmod(poss_divisor)
#     if remainder == 0
#       results_array << poss_divisor
#       results_array << quotient
#       max_poss_divisor = quotient
#     end
#     poss_divisor += 1
#   end
#   results_array.sort
# end


# p divisors(1) == [1]
# p divisors(7) == [1, 7]
# p divisors(12) == [1, 2, 3, 4, 6, 12]
# p divisors(98) == [1, 2, 7, 14, 49, 98]
# p divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute
# p divisors(999962000357)

# exercise 5
# Problem:
# decrypt using Rot13 decryption and output each decrypted name in the following list
# names are in mixed case and should be returned in mixed case

# Decryption is as follows:
# letters in the lower half of the alphabet map to the upper half of the alphabet
# a->n, m->z
# letters in the upper half of the alphabet map to the lower half of the alphabet
# p->c, x->k

# def decrypt_text(encrypted_text)
#   encrypted_text.chars.map do |encrypted_char|
#     case encrypted_char
#     when 'a'..'m', 'A'..'M' then (encrypted_char.ord + 13).chr
#     when 'n'..'z', 'N'..'Z' then (encrypted_char.ord - 13).chr
#     else                    encrypted_char
#     end
#   end.join('')
# end

# NAMES = ['Nqn Ybirynpr',
#   'Tenpr Ubccre',
#   'Nqryr Tbyqfgvar',
#   'Nyna Ghevat',
#   'Puneyrf Onoontr',
#   'Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv',
#   'Wbua Ngnanfbss',
#   'Ybvf Unvog',
#   'Pynhqr Funaaba',
#   'Fgrir Wbof',
#   'Ovyy Tngrf',
#   'Gvz Orearef-Yrr',
#   'Fgrir Jbmavnx',
#   'Xbaenq Mhfr',
#   'Fve Nagbal Ubner',
#   'Zneiva Zvafxl',
#   'Lhxvuveb Zngfhzbgb',
#   'Unllvz Fybavzfxv',
#   'Tregehqr Oynapu']

# NAMES.each do |name|
#   puts decrypt_text(name)
# end

# exercise 6
# def any?(collection)
#   collection.each do |item|
#     return true if yield(item)
#   end
#   false
# end

# p any?([1, 3, 5, 6]) { |value| value.even? } == true
# p any?([1, 3, 5, 7]) { |value| value.even? } == false
# p any?([2, 4, 6, 8]) { |value| value.odd? } == false
# p any?([1, 3, 5, 7]) { |value| value % 5 == 0 } == true
# p any?([1, 3, 5, 7]) { |value| true } == true
# p any?([1, 3, 5, 7]) { |value| false } == false
# p any?([]) { |value| true } == false

# exercise 7
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

# exercise 8
# def none?(collection)
#   collection.each { |item| return false if yield(item) }
#   true
# end


# p none?([1, 3, 5, 6]) { |value| value.even? } == false
# p none?([1, 3, 5, 7]) { |value| value.even? } == true
# p none?([2, 4, 6, 8]) { |value| value.odd? } == true
# p none?([1, 3, 5, 7]) { |value| value % 5 == 0 } == false
# p none?([1, 3, 5, 7]) { |value| true } == false
# p none?([1, 3, 5, 7]) { |value| false } == true
# p none?([]) { |value| true } == true

# exercise 9
# def one?(collection)
#   counter = 0
#   collection.each do |item|
#     counter += 1 if yield(item)
#     return false if counter > 1
#   end
#   counter == 1 ? true : false
# end

# p one?([1, 3, 5, 6]) { |value| value.even? }    # -> true
# p one?([1, 3, 5, 7]) { |value| value.odd? }     # -> false
# p one?([2, 4, 6, 8]) { |value| value.even? }    # -> false
# p one?([1, 3, 5, 7]) { |value| value % 5 == 0 } # -> true
# p one?([1, 3, 5, 7]) { |value| true }           # -> false
# p one?([1, 3, 5, 7]) { |value| false }          # -> false
# p one?([]) { |value| true }                     # -> false

# exercise 10
# def count(collection)
#   counter = 0
#   collection.each do |item|
#     counter += 1 if yield(item)
#   end
#   counter
# end

# not using each, loop, while, or until
# def count(collection)
#   collection.map do |item|
#     yield(item) ? 1 : 0
#   end.sum
# end

# p count([1,2,3,4,5]) { |value| value.odd? } == 3
# p count([1,2,3,4,5]) { |value| value % 3 == 1 } == 2
# p count([1,2,3,4,5]) { |value| true } == 5
# p count([1,2,3,4,5]) { |value| false } == 0
# p count([]) { |value| value.even? } == 0
# p count(%w(Four score and seven)) { |value| value.size == 5 } == 2