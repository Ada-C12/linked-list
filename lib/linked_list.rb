
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
    return
  end
  
  # method to find if the linked list contains a node with specified value
  # returns true if found, false otherwise
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
  def find_max
    current = @head
    
    if current.nil?
      return nil
    else
      max_value = current.data
    end
    
    until current.nil?
      max_value = current.data if current.data > max_value
      current = current.next
    end
    
    return max_value
  end
  
  # method to return the min value in the linked list
  # returns the data value and not the node
  def find_min
    current = @head
    
    if current.nil?
      return nil
    else
      min_value = current.data
    end
    
    until current.nil?
      min_value = current.data if current.data < min_value
      current = current.next
    end
    
    return min_value
  end
  
  
  # method that returns the length of the singly linked list
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
  def get_at_index(index)
    return nil if @head.nil?
    current = @head
    
    index.times do |i|
      return nil if current.nil?
      current = current.next
    end
    
    return current.data
  end
  
  # method to print all the values in the linked list
  def visit
    current = @head
    
    until current.nil?
      puts current.value
      current = current.next
    end
    
    return
  end
  
  # method to delete the first node found with specified value
  def delete(value)
    if @head.nil?
      return
    elsif @head.data == value
      @head = @head.next
      return
    end
    
    current = @head
    
    until current.next.nil?
      if current.next.data == value
        current.next = current.next.next
        return
      end
      
      current = current.next
    end
    
    return
  end
  
  # method to reverse the singly linked list
  # note: the nodes should be moved and not just the values in the nodes
  def reverse
    previous = nil
    
    until @head.nil?
      temp = @head.next
      @head.next = previous
      previous = @head
      @head = temp
    end
    
    @head = previous
    return
  end
  
  
  ## Advanced Exercises
  # returns the value at the middle element in the singly linked list
  def find_middle_value
    current = @head
    trailing = @head
    
    until current.nil?
      current = current.next
      
      if current.nil?
        return trailing.data
      end
      
      current = current.next
      trailing = trailing.next
    end
    
    # covers the case where the linked list is nil
    return nil if trailing.nil?
    # returns the right hand side value of the midpoint if the number of nodes is even
    return trailing.data
  end
  
  # find the nth node from the end and return its value
  # assume indexing starts at 0 while counting to n
  def find_nth_from_end(n)
    current = @head
    trailing = @head
    
    (n+1).times do |i|
      if current.nil?
        return nil
      end
      
      current = current.next
    end
    
    until current.nil?
      current = current.next
      trailing = trailing.next
    end
    
    return trailing.data
  end
  
  # checks if the linked list has a cycle. A cycle exists if any node in the
  # linked list links to a node already visited.
  # returns true if a cycle is found, false otherwise.
  def has_cycle
    if head.nil? || head.next.nil?
      return false
    end
    
    slow = @head
    fast = @head
    
    until fast.nil? || fast.next.nil?
      if slow == fast
        return true
      end
      
      fast = fast.next.next
      slow = slow.next
    end
    
    return false
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
      @head = Node.new(value)
      return
    end
    
    current = @head
    
    until current.next.nil?
      current = current.next
    end
    
    current.next = Node.new(value)
    return
  end
  
  # method that returns the value of the last node in the linked list
  # returns nil if the linked list is empty
  def get_last
    if @head.nil?
      return nil
    end
    
    current = @head
    
    until current.next.nil?
      current = current.next
    end
    
    return current.data
  end
  
  # method to insert a new node with specific data value, assuming the linked
  # list is sorted in ascending order
  def insert_ascending(value)
    newNode = Node.new(value)
    
    if @head.nil?
      @head = newNode
      return
    end
    
    current = @head
    previous = nil
    
    until current.nil? || current.data >= value
      previous = current
      current = current.next
    end
    
    if previous.nil?
      @head = newNode
    else
      previous.next = newNode
    end
    
    if current.nil?
      return
    else
      newNode.next = current
    end
    
    return
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
