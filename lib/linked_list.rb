
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
    return false if @head == nil
    current = @head
    
    while current do
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
    return nil if @head == nil
    current = @head
    max = @head.data
    
    while current do
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
    return nil if @head == nil
    current = @head
    min = @head.data
    
    while current do
      if current.data < min
        min = current.data
      end
      current = current.next
    end
    
    return min
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
    return nil if @head == nil
    list = ""
    current = @head
    
    while current
      list += "#{current.data} "
      current = current.next
    end
    
    return list
  end
  
  # method to delete the first node found with specified value
  def delete(value)
    return false if @head == nil
    current = @head.next
    previous = @head
    
    if @head.data == value
      @head = current
    end
    
    while current do
      if current.data == value
        previous.next = current.next
        break
      else
        previous = current
        current = current.next
      end
    end
  end
  
  # method to reverse the singly linked list
  # note: the nodes should be moved and not just the values in the nodes
  def reverse
    previous = nil
    temp = nil
    
    return nil if @head == nil
    current = @head
    
    
    while current do
      temp = current.next
      current.next = previous
      
      previous = current
      current = temp
    end
    
    @head = previous
  end
  
  ## Advanced Exercises
  # returns the value at the middle element in the singly linked list
  def find_middle_value
    current = @head
    count = 0
    
    until current.next == nil
      current = current.next
      count += 1
    end
    
    current = @head
    (count/2).times do 
      current = current.next
    end
    
    return current.data
  end
  
  # find the nth node from the end and return its value
  # assume indexing starts at 0 while counting to n
  def find_nth_from_end(n)
    return nil if @head == nil
    current = @head;
    check = @head;
    
    n.times do |i|
      check = check.next;
      if check == nil
        if i < n - 1
          return nil;
        end
        return nil;
      end
    end
    
    until check.next == nil do
      check = check.next;
      current = current.next;
    end
    
    return current.data;
  end
  
  # checks if the linked list has a cycle. A cycle exists if any node in the
  # linked list links to a node already visited.
  # returns true if a cycle is found, false otherwise.
  def has_cycle
    return nil if @head == nil
    
    slow = @head
    fast = @head
    
    while fast.nil? && fast.next.nil? do 
      slow = slow.next
      
      fast = fast.next
      fast = fast.next
      
      if slow == fast
        return true
      end
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
      return @head.data
    end
    
    current = @head
    until current.next == nil
      current = current.next
    end
    
    node = Node.new(value)
    current.next = node
    return node.data
  end
  
  # method that returns the value of the last node in the linked list
  # returns nil if the linked list is empty
  def get_last
    current = @head
    
    until current.next == nil
      current = current.next
    end
    
    return current.data
  end
  
  # method to insert a new node with specific data value, assuming the linked
  # list is sorted in ascending order
  def insert_ascending(value)
    return false if @head == nil
    previous = nil
    current = @head
    
    while current do
      if current.data > value
        break
      else
        previous = current
        current = current.next
      end
    end
    
    new_node = Node.new(value, current)
    previous.next = new_node
    
    
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

list = LinkedList.new
list.add_last(9)
list.add_last(10)
list.add_first(4)
list.add_first(3)
list.add_first(2)
puts(list.visit())

# list.delete(2)
# puts(list.visit())

# list.delete(10)
# puts(list.visit())

# list.delete(4)
# puts(list.visit())

# puts(list.find_nth_from_end(5))

# list.reverse()
# puts(list.visit())

# puts(list.find_middle_value())

list.insert_ascending(4)
puts(list.visit())