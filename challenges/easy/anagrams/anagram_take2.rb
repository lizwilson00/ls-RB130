# RB130 
# Challenges
# Easy
# Take 2
# Anagrams

# anagram_take2.rb

# Problem/Requirements
# a word will be passed in during Anagram object instantiation, call this the target word
# a set of words will be passed in as an array to the match method
# the match method will return the words that were passed in that are anagrams
# for the target word
# if multiple words are anagrams for the target word, then return them all
# the return value will be an array containing the words that are anagrams
# an idential word does not count as an anagram

# Data Structure
# need to return the resulting words in an array

# Algorithm
# Anagram object initialization
# word will be passed in and set to the instance variable @target_word

# match method
# initialize a new local variable results = []
# iterate through the passed in array words
# sort the target word and the word from the array
# if they are the same then select the word for the result

class Anagram
  attr_reader :target_word
  
  def initialize(target_word)
    @target_word = target_word
  end

  def match(words)
    words.select do |word|
      target_word.downcase != word.downcase && anagram?(target_word, word)
    end
  end

  def anagram?(word1, word2)
    word1.downcase.chars.sort.join == word2.downcase.chars.sort.join
  end
end


