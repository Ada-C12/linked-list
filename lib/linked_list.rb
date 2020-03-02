
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
  def add_first(value)
    new_node = Node.new(value, @head)
    @head = new_node
  end
  
  # method to find if the linked list contains a node with specified value
  # returns true if found, false otherwise
  def search(value)
    current = @head
    
    until current == nil
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
    end
    
    max = current.data
    
    until current == nil
      if current.data > max
        max = current.data
      end
      current = current.next
    end
    
    return max
  end
  
  # method to return the min value in the linked list
  # returns the data value and not the node
  def find_min
    current = @head
    
    if current == nil
      return nil
    end
    
    min = current.data
    
    until current == nil
      if current.data < min
        min = current.data
      end
      current = current.next
    end
    
    return min
  end
  
  
  # method that returns the length of the singly linked list
  def length
    current = @head
    length = 0
    
    if @head == nil
      return length
    else
      until current == nil
        current = current.next
        length += 1
      end
      return length
    end
  end
  
  # method that returns the value at a given index in the linked list
  # index count starts at 0
  # returns nil if there are fewer nodes in the linked list than the index value
  def get_at_index(index)
    current = @head
    counter = 0
    
    if current == nil
      return nil
    end
    
    while counter <= index
      if current == nil
        return nil
      elsif counter == index
        return current.data
      end
      
      current = current.next 
      counter += 1
    end
  end
  
  # method to print all the values in the linked list
  def visit
    raise NotImplementedError
  end
  
  # method to delete the first node found with specified value
  def delete(value)
    current = @head
    previous = nil
    
    until current == nil
      if current.data == value
        if previous == nil 
          @head = current.next
        else
          previous.next = current.next
        end
      end
      
      previous = current
      current = current.next
    end
  end
  
  # method to reverse the singly linked list
  # note: the nodes should be moved and not just the values in the nodes
  def reverse
    raise NotImplementedError
  end
  
  
  ## Advanced Exercises
  # returns the value at the middle element in the singly linked list
  def find_middle_value
    raise NotImplementedError
  end
  
  # find the nth node from the end and return its value
  # assume indexing starts at 0 while counting to n
  def find_nth_from_end(n)
    current = @head
    counter = 0
    all_data = []
    
    if current == nil
      return nil
    end
    
    until current == nil
      all_data << current.data
      current = current.next
      counter += 1
    end
    
    if n >= all_data.length 
      return nil
    end
    
    return all_data[all_data.length - (n + 1)]
  end
  
  # checks if the linked list has a cycle. A cycle exists if any node in the
  # linked list links to a node already visited.
  # returns true if a cycle is found, false otherwise.
  def has_cycle
    fast = @head.next
    slow = @head
    
    until fast.nil? || slow.nil?
      if fast == slow
        return true
      end
      
      fast = fast.next
      fast = fast.next unless fast.nil?
      slow = slow.next
    end
    
    return false
  end
  
  
  # Additional Exercises 
  # returns the value in the first node
  # returns nil if the list is empty
  def get_first
    if @head == nil
      return nil
    else
      return @head.data
    end
  end
  
  # method that inserts a given value as a new last node in the linked list
  def add_last(value)
    new_node = Node.new(value, nil)
    current = @head
    
    if current == nil
      @head = new_node
    else
      until current.next == nil
        current = current.next
      end
      current.next = new_node
    end
  end
  
  # method that returns the value of the last node in the linked list
  # returns nil if the linked list is empty
  def get_last
    current = @head
    
    if current == nil
      return nil
    else
      until current.next == nil
        current = current.next
      end
      return current.data
    end
  end
  
  # method to insert a new node with specific data value, assuming the linked
  # list is sorted in ascending order
  def insert_ascending(value)
    raise NotImplementedError
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
