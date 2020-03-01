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
  # Time Complexity: O(1)
  # Space Complexity: O(1)
  def add_first(value)
    new_node = Node.new(value)
    new_node.next = @head
    @head = new_node
  end
  
  # method to find if the linked list contains a node with specified value
  # returns true if found, false otherwise
  # Time Complexity: O(n)
  # Space Complexity: O(1)
  def search(value)
    current = @head
    
    until current.nil?
      return true if current.data == value
      current = current.next
    end
    return false
  end
  
  # method to return the max value in the linked list
  # returns the data value and not the node
  # Time Complexity: O(n)
  # Space Complexity: O(1)
  def find_max
    return if @head.nil?
    
    current = @head
    max = @head.data
    
    until current.nil?
      if current.data > max
        max = current.data
      end 
      current = current.next
    end 
    return max
  end
  
  # method to return the min value in the linked list
  # returns the data value and not the node
  # Time Complexity: O(n)
  # Space Complexity: O(1)
  def find_min
    return if @head.nil?
    
    current = @head
    min = @head.data
    
    until current.nil?
      if current.data < min
        min = current.data
      end 
      current = current.next
    end
    return min
  end
  
  # method that returns the length of the singly linked list
  # Time Complexity: O(n)
  # Space Complexity: O(1)
  def length    
    current = @head
    length = 0
    
    until current.nil?
      length += 1
      current = current.next  
    end
    return length
  end
  
  # method that returns the value at a given index in the linked list
  # index count starts at 0
  # returns nil if there are fewer nodes in the linked list than the index value
  # Time Complexity: O(n)
  # Space Complexity: O(1)
  def get_at_index(index)
    current = @head
    count = 0 
    
    until current.nil?
      if (count == index)
        return current.data
      end
      count += 1
      current = current.next
    end
  end
  
  # method to print all the values in the linked list
  # Time Complexity: O(n)
  # Space Complexity: O(1)
  def visit    
    current = @head
    
    until current.nil?
      print current.data
      current = current.next
    end
  end
  
  # method to delete the first node found with specified value
  # Time Complexity: O(n)
  # Space Complexity: O(1)
  def delete(value)
    current = @head
    previous = nil
    
    until current.nil?
      if current.data == value
        if previous.nil?
          @head = current.next
          return current.next = current.next.next
        else
          previous.next = current.next
          break
        end 
      end 
      
      previous = current
      current = current.next
    end
  end 
  
  # method to reverse the singly linked list
  # note: the nodes should be moved and not just the values in the nodes
  # Time Complexity: O(n)
  # Space Complexity: O(1) - reverse in place
  def reverse
    return if @head.nil?
    
    current = @head
    previous = nil
    
    until current.next.nil?
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
  # Time Complexity:
  # Space Complexity:
  def find_middle_value
    fast = @root
    slow = @root
    
    until fast.nil?
      fast = fast.next
      fast = fast.next unless fast.nil?
      slow = slow.next
    end
    return slow
  end
  
  # find the nth node from the end and return its value
  # assume indexing starts at 0 while counting to n
  # Time Complexity: O(n+m) - two loops with different lengths
  # Space Complexity: O(1)
  def find_nth_from_end(n)
    return if @head.nil?
    current = @head
    length = 0
    
    until current.next.nil?
      length += 1
      current = current.next
    end 
    
    return nil if n > length
    
    current = @head
    (length - n).times do |i|
      current = current.next
    end 
    
    return current.data
  end
  
  # checks if the linked list has a cycle. A cycle exists if any node in the
  # linked list links to a node already visited.
  # returns true if a cycle is found, false otherwise.
  # Time Complexity:
  # Space Complexity:
  def has_cycle
    fast = @head.next
    fast = fast.next if fast
    slow = @head
    
    until fast.nil? || slow.nil?
      if fast == slow
        return true
      end
      
      fast = fast.next
      return if fast == slow
      fast = fast.next unless fast.nil?
      slow = slow.next
    end
    return false
  end
  
  # Additional Exercises 
  # returns the value in the first node
  # returns nil if the list is empty
  # Time Complexity: O(n)
  # Space Complexity: O(1)
  def get_first
    return nil if @head.nil?
    @head.data
  end
  
  # method that inserts a given value as a new last node in the linked list
  # Time Complexity: O(n)
  # Space Complexity: O(1)
  def add_last(value)
    new_node = Node.new(value)
    
    if @head.nil?
      return @head = new_node
    end
    
    current = @head
    until current.next.nil?
      current = current.next
    end 
    
    current.next = new_node
  end 
  
  # method that returns the value of the last node in the linked list
  # returns nil if the linked list is empty
  # Time Complexity: O(n)
  # Space Complexity: O(1)
  def get_last
    return nil if @head.nil?  
    
    current = @head
    until current.next.nil?
      current = current.next
    end 
    
    return current.data
  end
  
  # method to insert a new node with specific data value, assuming the linked
  # list is sorted in ascending order
  # Time Complexity:
  # Space Complexity:
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
