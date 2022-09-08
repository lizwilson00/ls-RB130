# RB130
# Challenges
# Medium
# Custom Set

# custom_set.rb
# Problem:
# Create a custom set that is able to be manipulated in various ways
# the set will be comprised of unique numbers
# when the set is created a set of numbers in the form of an array MAY be passed in
# or there may be no argument passed in
# The array of numbers will be stored in an instance variable @set
# If nothing is passed in then @set will be an empty array
# methods that will be available to the set will be defined follows:
  # empty?
    # will work similarly to how a array#empty? method works
    # true if empty, false otherwise
  # contains?
    # one argument will be passed in, call this elem
    # checks to see if the set includes a certain element  
    # call include? on the array @set and pass in elem
  # eql?
    # checks to see if the two sets (calling object and passed in object, other)
    # have the same set of numbers
    # sort both objects and compare
    # returns true if the same, else false
  # subset?
    # true if calling object is a subset of the passed in argument, else false
    # return false if the size of the calling object is greater than the size of the passed in object
    # one argument will be passed in, call this superset
    # this argument will be a CustomSet object
    # returns true if the superset contains all of the elements as the calling object (but the superset can also contain more than just those elements)
      # call eql? on the two sets, if true then return false, else continue
    # call contains on the superset, pass in each item of the calling object
    # if all calls return true then true, else false
  # disjoint?
    # returns true if either the calling set or the passed in set has @set equal to []
    # check to see if the intersection is empty - if empty then true, else false
  # add
    # takes one argument  
    # push the passed in argument to the array @set unless set contains argument
    # return the set
  # ==
    # call eql? on both sets
  # intersection
    # takes one set as an argument
    # returns a new set object that contains a @set with each element found in both @set sets between self and the passed in array
    # find the intersection between the two arrays (self.set.intersection(other.set)), call this intersection
    # create a new set object and pass in intersection
    # return this new set object
  # difference
    # returns a new set object that contains a @set with only those elements from self that are not found in the passed in array, order is preserved
    # leverage the array#difference method on the two @set objects
    # create a new object with the result of the above call, and return the object
  # union
    # returns a new set object that contains a @set that is the union of self with the passed in array, order is preserved
    # leverage the array#union method on the two @set objects
    # create a new object with the result of the above call, and return the object

# class CustomSet
#   attr_accessor :set

#   def initialize(array = [])
#     @set = array.uniq
#   end

#   def empty?
#     @set.empty?
#   end

#   def contains?(elem)
#     set.include?(elem)
#   end

#   def eql?(other)
#     set.sort == other.set.sort
#   end

#   def subset?(superset)
#     return false if set.size > superset.set.size
#     set.all? do |elem|
#       superset.set.include?(elem)
#     end
#   end

#   def disjoint?(other)
#     intersection(other).empty?
#   end

#   def add(num)
#     set.push(num) unless contains?(num)
#     self
#   end

#   def ==(other)
#     eql?(other)
#   end

#   def intersection(other)
#     CustomSet.new(set.intersection(other.set))
#   end

#   def difference(other)
#     CustomSet.new(set.difference(other.set))
#   end

#   def union(other)
#     CustomSet.new(set.union(other.set))
#   end
# end

# rewrite using a hash solution
class CustomSet
  attr_accessor :set

  def initialize(array = [])
    @set = Hash.new
    array.uniq.each do |num|
      @set[num] = true
    end
  end

  def empty?
    @set.empty?
  end

  def contains?(elem)
    set.keys.include?(elem)
  end

  def eql?(other)
    set == other.set
  end

  def subset?(superset)
    return false if set.size > superset.set.size
    set.keys.all? do |elem|
      superset.contains?(elem)
    end
  end

  def disjoint?(other)
    intersection(other).empty?
  end

  def add(num)
    set[num] = true unless contains?(num)
    self
  end

  def ==(other)
    eql?(other)
  end

  def intersection(other)
    CustomSet.new(set.keys.intersection(other.set.keys))
  end

  def difference(other)
    CustomSet.new(set.keys.difference(other.set.keys))
  end

  def union(other)
    CustomSet.new(set.keys.union(other.set.keys))
  end
end
