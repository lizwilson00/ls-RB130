# RB130
# Challenges
# Roman Numerals

# roman_numerals_soln.rb

class RomanNumeral
  attr_accessor :number

  ROMAN_NUMERALS = {
    "I" => 1,
    "IV" => 4,
    "V" => 5,
    "IX" => 9,
    "X" => 10,
    "XL" => 40,
    "L" => 50,
    "XC" => 90,
    "C" => 100,
    "CD" => 400,
    "D" => 500,
    "CM" => 900,
    "M" => 1000,
  }

  def initialize(number)
    @number = number
  end

  def to_roman
    roman_version = ''
    to_convert = number

    rn_keys = ROMAN_NUMERALS.sort_by { |_, value| value }.reverse.to_h.keys
    rn_keys.each do |key|
      multiplier, remainder = to_convert.divmod(ROMAN_NUMERALS[key])
      if multiplier > 0
        roman_version += (key * multiplier)
      end
      to_convert = remainder
    end
    roman_version
  end
end