
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
    current = @head
    @head = Node.new(value, current)
  end
  
  # method to find if the linked list contains a node with specified value
  # returns true if found, false otherwise
  def search(value)
    raise NotImplementedError
  end
  
  # method to return the max value in the linked list
  # returns the data value and not the node
  def find_max
    raise NotImplementedError
  end
  
  # method to return the min value in the linked list
  # returns the data value and not the node
  def find_min
    raise NotImplementedError
  end
  
  
  # method that returns the length of the singly linked list
  def length
    node = @head
    count = 0
    
    return 0 if @head == nil
    
    until node == nil
      count += 1
      node = node.next
    end
    return count
  end
  
  # method that returns the value at a given index in the linked list
  # index count starts at 0
  # returns nil if there are fewer nodes in the linked list than the index value
  def get_at_index(index)
    return nil if @head == nil
    current = @head
    index.times do 
      current = current.next
    end
    
    return current.data
  end
  
  # method to print all the values in the linked list
  def visit
    raise NotImplementedError
  end
  
  # method to delete the first node found with specified value
  def delete(value)
    raise NotImplementedError
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
    current = @head;
    check = @head;
    
    n.times do |i|
      check = check.next;
      if check == nil
        if i < n - 1
          return nil;
        end
        return current.data;
      end
    end
    
    while check.next != nil do
      check = check.next;
      current = current.next;
    end
    
    return current.data;
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
    return nil if @head.nil?
    return @head.data
  end
  
  # method that inserts a given value as a new last node in the linked list
  def add_last(value)
    if @head.nil?
      @head = Node.new(data)
      return head.data
    end
    
    current = @head
    until current.next == nil
      current = current.next
    end
    
    node = Node.new(data)
    current.next = node
    return node.data
  end
  
  # method that returns the value of the last node in the linked list
  # returns nil if the linked list is empty
  def get_last
    current = head
    
    until current.next == nil
      current = current.next
    end
    
    return current.data
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
