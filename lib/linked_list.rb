
# Defines a node in the singly linked list
class Node
  attr_reader :data # allow external entities to read value but not write
  attr_accessor :next # allow external entities to read or write next node
  
  def initialize(value, next_node = nil)
    @data = value
    @next = next_node
  end
end

# Defines the singly linked list
class LinkedList
  def initialize
    @head = nil # keep the head private. Not accessible outside this class
  end
  
  # method to add a new node with the specific data value in the linked list
  # insert the new node at the beginning of the linked list
  def add_first(data)
    current_first = @head
    if @head == nil 
      temp = Node.new(data)
      @head = temp
    else
      temp = Node.new(data)
      temp.next = @head
      @head = temp
    end
  end
  
  # method to find if the linked list contains a node with specified value
  # returns true if found, false otherwise
  def search(value)
    
    current = @head
    
    if current == nil
      return false
    elsif current.data == nil
      return false
    end
    
    until current.next == nil do
      if current.data == value
        return true
      else
        current = current.next
      end
    end
    
    return false
    
  end
  
  # method to return the max value in the linked list
  # returns the data value and not the node
  def find_max
    current = @head
    if current == nil
      return nil
    elsif current.next == nil
      return current.data
    end
    
    temp = current.data
    
    until current.next == nil do
      if current.data > temp
        temp = current.data
      end
      current = current.next
    end
    
    if current.data > temp
      return current.data
    else
      return temp
    end
    
  end
  
  # method to return the min value in the linked list
  # returns the data value and not the node
  def find_min
    current = @head
    if current == nil
      return nil
    elsif current.next == nil
      return current.data
    end
    
    temp = current.data
    
    until current.next == nil do
      if current.data < temp
        temp = current.data
        current = current.next
      else
        current = current.next
      end
    end
    
    if current.data < temp
      return current.data
    else
      return temp
    end
  end
  
  
  # method that returns the length of the singly linked list
  def length
    current = @head
    if current == nil
      return 0
    elsif current.next == nil
      return 1
    end
    
    counter = 1
    
    until current.next == nil do 
      current = current.next
      counter += 1
    end
    
    return counter
    
  end
  
  # method that returns the value at a given index in the linked list
  # index count starts at 0
  # returns nil if there are fewer nodes in the linked list than the index value
  def get_at_index(index)
    current = @head
    if index == 0
      return current.data
    elsif
      current == nil
      return nil
    end
    
    counter = 0
    
    until counter == index do
      if current.next == nil
        return nil
      else
        current = current.next
        counter += 1
      end
    end
    return current.data
    
  end
  
  # method to print all the values in the linked list
  def visit
    current = @head
    
    until current.next == nil do 
      puts current.data
      current = current.next
    end
    
    print current.data # fence-post
    
  end
  
  # method to delete the first node found with specified value
  def delete(value)
    
    current = @head
    
    if current == nil
      return
    elsif current.data == value
      @head = current.next
      return
    end
    
    if current.next.data == value
      current.next = current.next.next
      return
    end
    
    until current.next == nil do
      if current.next.data == value
        current.next = current.next.next
        return
      else
        current = current.next
      end
    end
  end
  
  # method to reverse the singly linked list
  # note: the nodes should be moved and not just the values in the nodes
  def reverse
    current = @head
    previous = nil
    
    if current.next == nil 
      return
    end
    
    until current.next == nil do 
      temp = current.next
      current.next = previous
      previous = current
      current = temp
      
    end
    
    current.next = previous
    @head = current
  end
  
  ## Advanced Exercises
  # returns the value at the middle element in the singly linked list
  def find_middle_value
    current = @head
    
    if current == nil
      return nil
    end
    
    length = length()
    
    half = length / 2
    
    return_array = []
    
    if length.odd?
      return_array.push(get_at_index(half))
      return return_array
    else
      counter = 0
      half_target = half -1
      until counter == half_target do
        current = current.next
        counter += 1
      end
      return_array.push(current.data)
      return_array.push(current.next.data)
    end
    return return_array
  end
  
  
  # find the nth node from the end and return its value
  # assume indexing starts at 0 while counting to n
  def find_nth_from_end(n)
    current = @head
    
    if current == nil
      return
    elsif current.next == nil
      return 
    end
    
    k_head = nil
    
    counter = 0
    
    until counter == n do
      if current.next == nil
        return
      else
        current = current.next
        counter += 1
      end
    end
    
    #  right now current is set to the nth value ahead of actual head, so we're going to reassign it to k_head so that we'll have a pointer that's looking to equal nil when the end of the list is reached
    
    k_head = current
    
    # current is reset to head
    current = @head
    
    until k_head.next == nil do
      k_head = k_head.next
      current = current.next
    end
    
    return current.data
    
  end
  
  # checks if the linked list has a cycle. A cycle exists if any node in the
  # linked list links to a node already visited.
  # returns true if a cycle is found, false otherwise.
  def has_cycle
    
    current = @head
    
    if current == nil
      return false
    end
    
    seen_array = []
    
    until current.next == nil do
      if seen_array.include?(current.object_id)
        return true
      else
        seen_array.push(current.object_id)
        current = current.next
      end
    end
    
    return false
    
  end
  
  
  # Additional Exercises 
  # returns the value in the first node
  # returns nil if the list is empty
  def get_first
    current = @head
    if current == nil
      return nil
    else
      return current.data
    end
  end
  
  # method that inserts a given value as a new last node in the linked list
  def add_last(value)
    current = @head
    temp = Node.new(value)
    
    if current == nil
      @head = temp
      return
    end
    
    until current.next == nil do
      current = current.next
    end
    current.next = temp
  end
  
  # method that returns the value of the last node in the linked list
  # returns nil if the linked list is empty
  def get_last
    current = @head
    
    if current == nil
      return nil
    elsif current.next == nil
      return current.data
    end
    
    until current.next == nil do
      current = current.next
    end
    
    return current.data
    
  end
  
  # method to insert a new node with specific data value, assuming the linked
  # list is sorted in ascending order
  def insert_ascending(value)
    current = @head
    
    if current == nil
      add_first(value)
      return
    elsif value < current.data
      add_first(value)
      return
    end
    
    temp = Node.new(value)
    
    until current.next.next == nil
      if current.next.data < value 
        current = current.next
      else
        temp.next = current.next
        current.next = temp
        return
      end
    end
    
    if current.next.data > value
      temp.next = current.next
      current.next = temp
      return
    else
      current.next.next = temp
    end
  end
  
  # Helper method for tests
  # Creates a cycle in the linked list for testing purposes
  # Assumes the linked list has at least one node
  def create_cycle
    return if @head == nil # don't do anything if the linked list is empty
    
    # navigate to last node
    current = @head
    while current.next != nil
      current = current.next
    end
    
    current.next = @head # make the last node link to first node
  end
end
