
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
    if @head
      @head = Node.new(value, @head)
    else
      @head = Node.new(value)
    end
  end
  
  # method to find if the linked list contains a node with specified value
  # returns true if found, false otherwise
  def search(value)
    current = @head
    until current.nil?
      if current.value == value
        return current
      else
        current = current.next
      end
    end
    
  end
  
  # method to return the max value in the linked list
  # returns the data value and not the node
  def find_max
    # checks if current is nil
    if @head
      currentMax = @head.data
    else
      return nil
    end
    
    # checks if next is nil
    if @head.next
      checkAgainstMax = @head.next
    else
      return currentMax
    end
    
    while checkAgainstMax
      if checkAgainstMax.data > currentMax
        currentMax = checkAgainstMax.data
        if checkAgainstMax.next
          checkAgainstMax = checkAgainstMax.next
        else
          return currentMax
        end
      else
        if checkAgainstMax.next
          checkAgainstMax = checkAgainstMax.next
        else
          return currentMax
        end
      end
    end
    return currentMax    
  end
  
  # method to return the min value in the linked list
  # returns the data value and not the node
  def find_min
    # checks if current is nil
    if @head
      currentMin = @head.data
    else
      return nil
    end
    
    # checks if next is nil
    if @head.next
      checkAgainstMin = @head.next
    else
      return currentMin
    end
    
    while checkAgainstMin
      if checkAgainstMin.data < currentMin
        currentMin = checkAgainstMin.data
        if checkAgainstMin.next
          checkAgainstMin = checkAgainstMin.next
        else
          return currentMin
        end
      else
        if checkAgainstMin.next
          checkAgainstMin = checkAgainstMin.next
        else
          return currentMin
        end
      end
    end
    return currentMin
  end
  
  
  # method that returns the length of the singly linked list
  def length
    count = 0
    if @head
      count += 1
      current = @head
      while current.next
        current = current.next
        count += 1
      end
    end
    return count
  end
  
  # method that returns the value at a given index in the linked list
  # index count starts at 0
  # returns nil if there are fewer nodes in the linked list than the index value
  def get_at_index(index)
    if @head
      count = 0
      currentNode = @head
      while count < index
        currentNode = currentNode.next
        count += 1
      end
      return currentNode.data
    else
      return nil
    end
  end
  
  # method to print all the values in the linked list
  def visit
    if @head
      current = @head
      while current
        p current.data
        current = current.next
      end
    else
      return nil
    end
    
  end
  
  # method to delete the first node found with specified value
  def delete(value)
    # make sure head exists
    if @head
      # set current node to head
      currentNode = @head
      prevNode = nil
      while currentNode
        if currentNode.data == value
          if currentNode.next
            # remove current node from link by assigning current node's next to previous node
            if prevNode
              prevNode.next = currentNode.next
              currentNode = nil
            else
              @head = currentNode.next
              currentNode = nil
            end
          else
            # remove current node from link
            prevNode.next = nil
            currentNode = nil
          end
        else
          prevNode = currentNode
          if currentNode.next
            currentNode = currentNode.next
          else
            return nil
          end
        end
      end
    else
      return nil
    end
  end
  
  # method to reverse the singly linked list
  # note: the nodes should be moved and not just the values in the nodes
  def reverse
    if @head
      current = @head
      current_next = @head.next
      while current_next.next
        a = current
        b = current_next
        c = b.next
        b.next = a
        current = b
        current_next = c
      end
      @head.next = nil
      @head = current
    else
      return nil
    end
  end
  
  
  ## Advanced Exercises
  # returns the value at the middle element in the singly linked list
  def find_middle_value
    raise NotImplementedError
  end
  
  # find the nth node from the end and return its value
  # assume indexing starts at 0 while counting to n
  def find_nth_from_end(n)
    if @head
      count = 0
      current = @head
      while count < n
        current = current.next
        count += 1
      end
      nth_from_end = @head
      if current.next
        current = current.next
        nth_from_end = nth_from_end.next
      end
      return nth_from_end.data
    else
      return nil
    end
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
    if @head
      return @head.data
    else
      return nil
    end
  end
  
  # method that inserts a given value as a new last node in the linked list
  def add_last(value)
    newNode = Node.new(value)
    if @head
      current = @head
      while current.next
        current = current.next
      end
      current.next = newNode
    else
      @head = newNode
    end
  end
  
  # method that returns the value of the last node in the linked list
  # returns nil if the linked list is empty
  def get_last
    if @head
      current = @head
      while current.next
        current = current.next
      end
      return current.data
    else
      return nil
    end  end
    
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
  