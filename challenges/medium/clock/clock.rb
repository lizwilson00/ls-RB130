# RB130
# Challenges
# Medium
# Clock

# clock.rb

# Problem
# create a clock that displays hours and minutes in military time (ex: 23:30, 08:51)
# public methods will allow for minutes to be added or subtracted from the clock
  # the number of minutes added or subtracted can be more than the number
  # of minutes in one day (1440), the clock must be able to "wrap around"
# public method will allow for the clock to be set at a given time
# first parameter passed in will be the hours and the second parameter (optional)
# will be the minutes
# The program will not have to handle invalid clock arguments being passed in (ex: 25, 91)

# Examples
# at method
# 8 is passed in
# returns '08:00'

# + method
# 8 is passed in, current time of clock is 23:59
# returns '00:07'

# - method
# 50 is passed in, current time of clock is 0
# returns '23:10'

# Data Structure
# will need constants to store minutes per hour, hours per day, minutes per day

# Algorithm
# at method
# instantiate a new Clock instance
  # set hours instance variable to first argument
  # set minutes instance variable to second argument (or 0 if an argument is not passed in)

# + method
# convert current clock hours to a number between 0 and 1439
# add the current clock minutes to the passed in minutes
# convert to a number between 0 and 1439
# convert to hours and minutes
# instantiate a new Clock object, passing in the new hours and minutes

# - method
# same as + method but subtract during step 2

# helper method: convert minutes
# minutes % 1440

# to_s method (displays the clock's current time, nicely formatted)
# format hours and minutes with leading 0s and return

# == method
# compares the hours and minutes of two clock objects 
# returns true if they are the same

class Clock
  MINUTES_PER_HOUR = 60
  HOURS_PER_DAY = 24
  MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR
  
  def initialize(hours, minutes)
    @hours = hours
    @minutes = minutes
  end

  def self.at(hours, minutes = 0)
    Clock.new(hours, minutes)
  end

  def +(other)
    new_mins = convert_minutes(curr_mins + other)
    update_time(new_mins)
  end

  def -(other)
    new_mins = convert_minutes(curr_mins - other)
    update_time(new_mins)
  end
  
  def to_s
    format('%02d:%02d', hours, minutes)
  end

  def ==(other)
    hours == other.hours && minutes == other.minutes
  end

  protected

  attr_reader :hours, :minutes
  
  def convert_minutes(mins)
    mins % MINUTES_PER_DAY
  end

  def update_time(new_mins)
    new_hours, new_minutes = new_mins.divmod(MINUTES_PER_HOUR)
    Clock.new(new_hours, new_minutes)
  end

  def curr_mins
    (hours * MINUTES_PER_HOUR) + minutes
  end
end