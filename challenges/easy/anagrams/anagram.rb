# RB130 
# Challenges
# Anagrams

# anagrams.rb

# Problem
# given a word (string) and a list of possible words (array)
# return only the words from the list in an array that are anagrams of the passed in word

# Assumptions/Rules
# The word will not contain spaces or special characters
# The word or the words in the anagram list can be mixed case
# When matching to potential anagrams, case should not be considered
# A word is an anagram of another word if all the letters of one word can be 
# rearranged to spell the other word
# If none of the words in the list is an anagram of the given word
# then return an empty array
# If the words are the same they are not anagrams of each other

# Examples
# word: 'Orchestra'
# list of anagrams: cashregister Carthorse radishes
# output: ['Carthorse']

# word: 'listen'
# list of anagrams: enlists google inlets banana
# ['inlets']

# Algorithm
# constructor (Anagram class)
# must take one argument (string) which will be the word
# save the word as an instance variable

# method: match
# must take one argument (array), call it possible_words
# initialize a new array, results_array to []
# iterate through the possible_words array, passing in the word
# and the word from the possible_words array (test word) into a method anagram?
# if the anagram? method comes back true then add the possible word to the results_array
# else, next
# return results_array

# method: anagrams?
# checks to see if two passed in words are anagrams of each other
# returns true if they are, else false
# downcase both word and test word
  # if they are the same then return false, else continue
# downcase the word, convert to an array and sort
# do the same for the test word
# if the sorted arrays are the same then return true
# else false


class Anagram
  def initialize(word)
    @word = word.downcase
  end

  def match(possible_words)
    possible_words.select do |test_word|
      word != test_word.downcase && anagrams?(word, test_word)
    end
  end

  private

  def anagrams?(word, test_word)
    word.chars.sort == test_word.downcase.chars.sort
  end

  attr_reader :word
end