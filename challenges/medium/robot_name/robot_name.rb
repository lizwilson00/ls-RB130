# RB130
# Challenges
# Medium
# Robot Name

# robot_name.rb

# Problem
# When the robot is first instantitated, assign a random name
# The random name must be two letters followed by three numbers, such as 'RX837'
# The robot will have to ability to be reset which will 
# assign it a new random name
# The program should not allow the same name to be used twice
# The robot's random name should be able to be retrieved publicly

# Example
# Robot1 is assigned a random name 'RX837'
# Robot1.name returns 'RX837'
# Robot1 is reset
# Robot1's new random name is 'AB123'
# Robot1.name returns 'AB123'

# Robot2 is created
# Robot2's random name comes up as 'AB123'
# The program will see that that name is already assigned to Robot1
# So a new random name will be generated
# The new random name is 'CD445' which is available
# Robot2.name returns 'CD445'

# Data Structure
# Names that are already assigned will be stored in a class array

# Algorithm
# start loop
  # generate the random name, call helper method for this
  # call it generate_random_name
    # initialize a string "random_name" to ''
    # random two characters
    # Run this twice, adding each character to the random_name string
    # ('A'..'Z').to_a.sample

    # random 3 digits
    # Run this and add to the random_name string '%003d' % rand(10 ** 3)

  # check new name against all_names array of 'used' names
  # helper method name_exists?
    # check if new name included in the all_names array
  # if new name is included then start the loop all over
  # break out of the loop if new name is not included
# end loop

# reset name method
  # remove name from name array
  # call same logic as the initialize method to assign name

class Robot
  attr_reader :name

  @@name_array = []
  
  def initialize
    @name = assign_robot_name
  end

  def reset
    @@name_array.delete(name)
    self.name = assign_robot_name
  end

  private

  attr_writer :name
  
  def assign_robot_name
    loop do
      new_name = generate_random_name
      next if name_exists?(new_name)
      add_to_name_array(new_name)
      return new_name
    end
  end

  def generate_random_name
    random_name = ''
    2.times { random_name << ('A'..'Z').to_a.sample }
    3.times { random_name << (0..9).to_a.sample.to_s }
    random_name
  end
  
  def name_exists?(new_name)
    @@name_array.include?(new_name) 
  end

  def add_to_name_array(new_name)
    @@name_array << new_name
  end
end
