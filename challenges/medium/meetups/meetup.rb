# RB130
# Challenges
# Medium
# Meetups

# meetup.rb

# Problem
# The program will determine the date of a meetup event
# given a month, year, day of the week, and frequency
# frequency options are: first, second, third, fourth, fifth, last, and teenth
# teenth is one of the 7 days of the month that end in 'teenth' (Ex: 13th)
# if there isn't a day that can meet the requirements for that month
# then return nil (Ex: 5th Wednesday in February)

# Examples
# new Meetup object with a month of March, year of 2013
# day of the meetup will be Monday
# frequency will be first
# the date of the first Monday that month was 3/4/2013
# so that date will be returned

# Data Structure
# store the frequency options in a hash, map them to a start date
# store the days of the week as a hash, map them to a number ('monday' => 1)

# Algorithm
# initialization of a new Meetup object
# store the month as a number
# store the year as a number

# day method
# two parameters: 
  # day of the week, downcase the input value before storing to a local variable
  # frequency, again downcase and store to a local variable

# construct a date object with the month and year of the calling object 
# and the 1st day of the month
# find the day of the week of that date (monday, tues, wed, etc)
# find the start date where we should start looking
  # non-'last': use the hash to find the start day
  # 'last': find the last day of the month and subtract 6
  # create a date object with the start date
# find the date of the "target day"
  # for example, find the first Monday of March 2013
  # Call a helper method called find_next_target_weekday
  # pass in the appropriate start date determined from above
  # also pass in the target weekday as a number
  # the method will return the date of the target 
    # say it's a friday (5) and in our example we're looking for a monday (1)
    # in that case we want to add 3 to March 1st to get to March 4th 
    # determine how many days to add to the date:
      # when the day found > target day (5 > 1) then add 7 to the target day
      # and subtract the day found from the new target day to get the number of days to add
      # when the day found < target day (say the 1st is a Tuesday (2) and 
      # the target day is a Friday (5)) then just subtract the day found
      # from the target day to get the number of days to add
      # when the day found == target day then return the date that was passed in
    # we may have gone past the month we need (especially in the case of 'fifth' frequency
      # if the month of the returned date is not the same as the target month then return nil
      # else return the date

# notes
# wday returns the day of the calendar week as a number (Monday is 1)

require 'date'

class Meetup
  DAYS_OF_WEEK = %w(sunday monday tuesday wednesday thursday friday saturday sunday)
  START_DAY = { 'teenth' => 13, 
                'first' => 1,
                'second' => 8,
                'third' => 15,
                'fourth' => 22,
                'fifth' => 29 }
  
  attr_reader :year, :month
  
  def initialize(year, month)
    @year = year
    @month = month
  end

  def day(day_of_week, frequency)
    weekday = DAYS_OF_WEEK.find_index(day_of_week.downcase)
    freq = frequency.downcase
    start_date = if freq == 'last' 
                   Date.new(year, month, -7)
                 else
                   Date.new(year, month, START_DAY[freq])
                 end
    target_date = find_next_target_weekday(start_date, weekday)
    target_date.month == month ? target_date : nil
  end

  def find_next_target_weekday(date, weekday)
    curr_day = date.wday
    return date if weekday == curr_day

    weekday += 7 if curr_day > weekday
    date + weekday - curr_day
  end
end