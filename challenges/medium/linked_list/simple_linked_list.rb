# RB130
# Challenges
# Medium
# Simple Linked List

# simple_linked_list.rb
# Problem: 
# create a program to handle elements of a linked list
# when one element is passed in then the 
# datum method (instance method, Element class)
  # will return the object that was passed in
  # when instantiating an Element object
# tail? method (instance method, Element class)
  # returns true or false if the calling object is considered the tail (first item loaded)
  # (check instance variable of the calling object)
# next method (instance method, Element class)
  # finds the next object associated with the calling object
  # this is the element loaded PRIOR to the calling element
# datum method (instance method, Element class)
  # returns the object associated with the calling object

# size method (instance method, SimpleLinkedList class)
  # returns the size of the list, the number of Element objects present
  # returns 0 if empty
# empty? method (instance method, SimpleLinkedList class)
  # true if array is empty, else false
# push method (instance method, SimpleLinkedList class)
  # Instantiates an Element object   
  # pushes the Element object to the end of the list
# empty? method (instance method, SimpleLinkedList class)
  # true if array is empty, else false
# peek method (instance method, SimpleLinkedList class)
  # call datum method on the last object
# head method
  # returns the last item in the list
# tail?
  # returns true if the item is first in the list (first to be added)
  # else false
# pop
  # removes the last element in the list, returns the value of that item
# from_a (class method, SimpleLinkedList class)
  # passes in a collection or nil, if nil then default will be []
  # class method
  # it should instantiate a SimpleLinkedList object
  # it should iterate through each object in the array,
  # adding each as an Element object, starting with the last object

# to_a (instance method, SimpleLinkedList class)
  # returns the array that is associated with the SimpleLinkedList object
  # datum is called on each element
  # return the array in reverse order

# reverse (instance method, SimpleLinkedList class)
  # reverses the list, returns a SimpleLinkedList object
  # call to_a on the associated list_array (gives us the original array) = org_array
  # create a new SimpleLinkedList object and call from_array on it
  # passing in org_array.reverse
  # return this new object


class Element
  attr_reader :data, :linked_element, :tail
  
  def initialize(data, linked_element = nil)
    @data = data
    @tail = linked_element.nil?
    @linked_element = linked_element
  end

  def datum
    data
  end

  def tail?
    tail
  end

  def next
    linked_element
  end
end

class SimpleLinkedList
  attr_accessor :list_array

  def initialize
    @list_array = []
  end

  def empty?
    list_array.empty?
  end

  def size
    list_array.size
  end

  def push(item)
    if list_array.empty?
      new_elem = Element.new(item)
    else
      prior_item_index = list_array.find_index(list_array.last)
      new_elem = Element.new(item, list_array[prior_item_index])
    end
    list_array.push(new_elem)
  end

  def peek
    return nil if list_array.empty?
    list_array.last.datum
  end

  def head
    return nil if list_array.empty?
    list_array.last
  end

  def pop
    return nil if list_array.empty?
    element = list_array.last.datum
    list_array.pop
    element
  end

  def self.from_a(array)
    new_list = SimpleLinkedList.new
    array = [] if array.nil?
    array.reverse.each do |datum|
      new_list.push(datum)
    end
    new_list
  end

  def to_a
    list_array.map { |elem| elem.datum }.reverse
  end

  def reverse
    SimpleLinkedList.from_a(to_a.reverse)
  end
end

# test = Element.new(1)
# p test.datum

# list = SimpleLinkedList.new
# list.push(1)
# list.push(2)
# p list.head.next
# p list.list_array.last.next
# p list.list_array.index(list.list_array.last)
# p list.head.next
# assert_equal 2, list.size
# assert_equal 2, list.head.datum
# assert_equal 1, list.head.next.datum
