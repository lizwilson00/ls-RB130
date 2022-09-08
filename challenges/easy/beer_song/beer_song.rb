# RB130
# Challenges
# Beer Song

# beer_song_test.rb

# problem
# output the 99 bottles of beer on the wall song
# must be able to pass in a number and that verse will be output
# multiple numbers can be passed in to the verse method
# the lyrics method will output the entire song
# assume that a valid verse number is passed in (a check for incorrect verse numbers will not be included)

# input for verse method: integer from 0 to 99
# output for verse method: string

# examples
# if we call the verse class method and pass in 1 we should get
# the following output:
# "1 bottle of beer on the wall, 1 bottle of beer.\n" \
# "Take it down and pass it around, no more bottles of beer on the wall.\n"

# if we call the verse class method and pass in 99 we should get
# the following output:
# "99 bottles of beer on the wall, 99 bottles of beer.\n" \
# "Take one down and pass it around, 98 bottles of beer on the wall.\n"

# Algorithm
# verse method (class method)
# one argument will be passed in, verse_num
# output will be the verse as a string
# if verse_num 3-99 then output
# "{verse_num} bottles of beer on the wall, {verse_num} bottles of beer.\n" \
# "Take one down and pass it around, {verse_num - 1} more bottles of beer on the wall.\n"

# if verse_num 2
# "2 bottles of beer on the wall, 2 bottles of beer.\n" \
# "Take one down and pass it around, 1 bottle of beer on the wall.\n"

# if verse_num 1
# "1 bottle of beer on the wall, 1 bottle of beer.\n" \
# "Take it down and pass it around, no more bottles of beer on the wall.\n"

# if verse_num 0
# "No more bottles of beer on the wall, no more bottles of beer.\n" \
#      "Go to the store and buy some more, 99 bottles of beer on the wall.\n"

# verses method (class method)
# takes two arguments, the beginning verse number and the ending verse number
# initialize a new string, result_string
# iterate through each verse, starting with the beginning verse
# continuing through the ending verse number
# call the verse method and pass in the current verse number
# add a line break after the verse except for the ending verse.
# add this string to the results string
# once finished iterating, return the results string

# lyrics method (class method)
# this puts all the verses together
# beginning line will be 99 and the ending line will be 0
# call the verses method and pass in these beginning and ending verse numbers

class BeerSong
  def self.verse(verse_num)
    case verse_num
    when 0 then verse_zero
    when 1 then verse_one
    when 2 then verse_two
    else        default_verse(verse_num)
    end
  end

  def self.verses(begin_num, end_num)
    return_string = ''
    begin_num.downto(end_num) do |verse_num|
      if verse_num == end_num
        return_string << verse(verse_num)
      else
        return_string << verse(verse_num) + "\n"
      end
    end
    return_string
  end

  def self.lyrics
    verses(99, 0)
  end

  class << self

    private

    def default_verse(verse_num)
      "#{verse_num} bottles of beer on the wall, #{verse_num} bottles of beer.\n" \
        "Take one down and pass it around, #{verse_num - 1} bottles of beer on the wall.\n"
    end

    def verse_two
      "2 bottles of beer on the wall, 2 bottles of beer.\n" \
      "Take one down and pass it around, 1 bottle of beer on the wall.\n"
    end

    def verse_one
      "1 bottle of beer on the wall, 1 bottle of beer.\n" \
      "Take it down and pass it around, no more bottles of beer on the wall.\n"
    end

    def verse_zero
      "No more bottles of beer on the wall, no more bottles of beer.\n" \
      "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
    end
  end
end
