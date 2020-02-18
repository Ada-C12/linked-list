
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
    @head = Node.new(value, @head)
  end
  
  # method to find if the linked list contains a node with specified value
  # returns true if found, false otherwise
  def search(value)
    return false if @head.nil?
    curr = @head
    until curr.next.nil?
      return true if curr.data == value
      curr = curr.next
    end
    return curr.data == value
  end
  
  # method to return the max value in the linked list
  # returns the data value and not the node
  def find_max
    return nil if @head.nil?
    max = @head.data
    curr = @head.next
    until curr.nil?
      max = curr.data if max < curr.data
      curr = curr.next
    end
    return max
  end
  
  # method to return the min value in the linked list
  # returns the data value and not the node
  def find_min
    return nil if @head.nil?
    min = @head.data
    curr = @head.next
    until curr.nil?
      min = curr.data if min > curr.data
      curr = curr.next
    end
    return min
  end
  
  
  # method that returns the length of the singly linked list
  def length
    count = 0
    return count if @head.nil?
    curr = @head
    until curr.nil?
      count += 1
      curr = curr.next
    end
    return count
  end
  
  # method that returns the value at a given index in the linked list
  # index count starts at 0
  # returns nil if there are fewer nodes in the linked list than the index value
  def get_at_index(index)
    return nil if index < 0 || index >= self.length
    curr = @head
    index.times do 
      curr = curr.next
    end
    return curr.data
  end
  
  # method to print all the values in the linked list
  def visit
    return nil if @head.nil?
    curr = @head
    until curr.nil?
      p curr.data
      curr = curr.next
    end
  end
  
  # method to delete the first node found with specified value
  def delete(value)
    return nil if @head.nil?
    if value == @head.data
      @head = @head.next
    else
      prev = @head
      curr = @head.next
      until curr.data == value || curr.next.nil?
        prev = curr
        curr = curr.next
      end
      if curr.data == value 
        prev.next = curr.next
      end
    end
  end
  
  # method to reverse the singly linked list
  # note: the nodes should be moved and not just the values in the nodes
  def reverse
    return nil if @head.nil?
    curr = @head 
    prev = nil 
    until curr.nil?
      temp = curr.next
      curr.next = prev
      prev = curr 
      curr = temp
    end
    @head = prev
  end
  
  ## Advanced Exercises
  # returns the value at the middle element in the singly linked list
  def find_middle_value
    return nil if @head.nil?
    return self.get_at_index(self.length/2)
  end
  
  # find the nth node from the end and return its value
  # assume indexing starts at 0 while counting to n
  def find_nth_from_end(n)
    return nil if @head.nil? || n > self.length - 1
    curr = @head
    res = @head
    n.times do 
      curr = curr.next
    end
    until curr.next.nil?
      curr = curr.next
      res = res.next
    end
    return res.data
  end
  
  # checks if the linked list has a cycle. A cycle exists if any node in the
  # linked list links to a node already visited.
  # returns true if a cycle is found, false otherwise.
  def has_cycle
    raise NotImplementedError
  end
  
  # Additional Exercises 
  # returns the value in the first node
  # returns nil if the list is empty
  def get_first
    return @head.nil? ? nil : @head.data
  end
  
  # method that inserts a given value as a new last node in the linked list
  def add_last(value)
    if @head.nil?
      self.add_first(value)
    else
      curr = @head
      until curr.next.nil?
        curr = curr.next
      end
      curr.next = Node.new(value)
    end
  end
  
  # method that returns the value of the last node in the linked list
  # returns nil if the linked list is empty
  def get_last
    return nil if @head.nil?
    self.get_at_index(self.length - 1)
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
