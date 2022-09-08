# RB130
# Challenges
# Scrabble

# scrabble_score.rb

# Problem
# given a passed in word (string), calculate the scrabble score

# Rules
# Return zero for values of nil, all whitespace, or if an empty string is passed in
# case does not matter, mixed case words may be passed in
# SCORE = { 'D' => 2, 'G' => 2, 'B' => 3, 'C' => 3, 'M' => 3, 'P' => 3,
            # 'F' => 4, 'H' => 4, 'V' => 4, 'W' => 4, 'Y' => 4, 'K' => 5,
            # 'J' => 8, 'X' => 8, 'Q' => 10, 'Z' => 10 }
# Letters that don't match to a key in the SCORE hash will be assigned values of 1

# Examples
# when nil is passed in, return 0
# when only whitespace is passed in, return 0 (ex: " \t\n")
# when an empty string is passed in, return 0
# 'a' returns 1
# 'cabbage' returns 14

# Data structure
# may be easier to iterate over the letters of the word if they are in an array
# scores will be stored in a hash, except for the letters with 1 as a value

# Algorithm
# constructor
# class will be called Scrabble
# word wil be passed in as an argument


# method: score
# return 0 if word is nil
# clean up the word, removing whitespace and uppercasing the word, call it cleansed_word
# return value of clean_up method will be assigned to a new variable, cleansed_word
# initialize a new variable score
# convert the characters to an array and iterate through each character
  # look up the character in the hash
    # if it exists then add the value to total
    # if it doesn't exist then add 1 to the total
# return total


class Scrabble
  SCORE = { 'D' => 2, 'G' => 2, 'B' => 3, 'C' => 3, 'M' => 3, 'P' => 3,
            'F' => 4, 'H' => 4, 'V' => 4, 'W' => 4, 'Y' => 4, 'K' => 5,
            'J' => 8, 'X' => 8, 'Q' => 10, 'Z' => 10 }
  
  def initialize(word)
    @word = word ? word : ''
  end

  def score
    cleansed_word = word.upcase.gsub(/[^A-Z]/, '')
    total = 0
    cleansed_word.chars.each do |char|
      total += SCORE[char] ? SCORE[char] : 1
    end
    total
  end

  def self.score(word)
    Scrabble.new(word).score
  end

  private

  attr_reader :word
end