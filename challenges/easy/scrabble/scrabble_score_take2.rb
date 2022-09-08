# RB130
# Challenges
# Easy
# Take 2
# Scrabble

# scrabble_take2.rb

# Problem/Requirements
# return 0 if non-letters are passed in (blank, nil, whitespace)
# score the word based on the following mapping

# SCRABBLE = {
#   %w(A E I O U L N R S T) =>	1,
#   %w(D G) =>	2,
#   %w(B C M P) =>	3,
#   %w(F H V W Y) =>	4,
#   %w(K) =>	5,
#   %w(J X) =>	8,
#   %w(Q Z) => 10
# }

# Algorithm
# Scrabble object instantiation
# pull out only the letters and store to an instance variable word

# score method
# initialize a new variable total
# iterate through each letter of the uppercase word, letter
  # iterate through each key of the SCRABBLE hash
  # check to see if the letter appears in that array
    # if it does then add the corresponding value to the total
# return the total

class Scrabble
  SCRABBLE = {
    %w(A E I O U L N R S T) =>	1,
    %w(D G) =>	2,
    %w(B C M P) =>	3,
    %w(F H V W Y) =>	4,
    %w(K) =>	5,
    %w(J X) =>	8,
    %w(Q Z) => 10
  }
  
  attr_reader :word
  
  def initialize(word)
    @word = word.nil? ? '' : valid_letters(word)
  end

  def score
    total = 0
    word.upcase.chars.each do |letter|
      SCRABBLE.each do |key, value|
        total += value if key.include?(letter)
      end
    end
    total
  end

  def valid_letters(word)
    word.chars.select { |char| char =~ /[a-zA-Z]/ }.join
  end

  def self.score(word)
    Scrabble.new(word).score
  end
end