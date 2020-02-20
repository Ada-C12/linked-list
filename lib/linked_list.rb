
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
    # checks if current is nil
    if @head
      current_max = @head.data
    else
      return nil
    end
    
    # checks if next is nil
    if @head.next
      check_against_max = @head.next
    else
      return current_max
    end
    
    while check_against_max
      if check_against_max.data > current_max
        current_max = check_against_max.data
        if check_against_max.next
          check_against_max = check_against_max.next
        else
          return current_max
        end
      else
        if check_against_max.next
          check_against_max = check_against_max.next
        else
          return current_max
        end
      end
    end
    return current_max    
  end
  
  # method to return the min value in the linked list
  # returns the data value and not the node
  def find_min
    # checks if current is nil
    if @head
      current_min = @head.data
    else
      return nil
    end
    
    # checks if next is nil
    if @head.next
      check_against_min = @head.next
    else
      return current_min
    end
    
    while check_against_min
      if check_against_min.data < current_min
        current_min = check_against_min.data
        if check_against_min.next
          check_against_min = check_against_min.next
        else
          return current_min
        end
      else
        if check_against_min.next
          check_against_min = check_against_min.next
        else
          return current_min
        end
      end
    end
    return current_min
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
      current_node = @head
      while count < index
        current_node = current_node.next
        count += 1
      end
      return current_node.data
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
      current_node = @head
      prevNode = nil
      while current_node
        if current_node.data == value
          if current_node.next
            # remove current node from link by assigning current node's next to previous node
            if prevNode
              prevNode.next = current_node.next
              current_node = nil
            else
              @head = current_node.next
              current_node = nil
            end
          else
            # remove current node from link
            prevNode.next = nil
            current_node = nil
          end
        else
          prevNode = current_node
          if current_node.next
            current_node = current_node.next
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
    # this will break if fed a linked list with fewer than three nodes
    if @head
      current = @head
      current_next = @head.next
      current_next_next = current_next.next
      
      while current.next
        if current_next.next
          current_next_next = current_next.next
          current_next.next = current
          current = current_next
          current_next = current_next_next
        else
          current_next.next = current
          current = current_next
          break
        end
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
    # UNTESTED
    if @head
      count = 0
      end_node = @head
      while end_node
        end_node = end_node.next
        count += 1
      end
      mid_point = count/2
      mid_node = @head
      while count >= mid_point
        mid_node = mid_node.next
        count -= 1
      end
      return mid_node.data
      
    else
      return nil
    end
    
  end
  
  # find the nth node from the end and return its value
  # assume indexing starts at 0 while counting to n
  def find_nth_from_end(n)
    if @head
      count = 0
      current = @head
      
      # moves pointer n nodes along the list
      while count < n
        current = current.next
        count += 1
      end
      
      # returns nil if n is larger than the length of the list
      return nil if current.nil?
      
      # assigns another pointer to the head of the list
      nth_from_end = @head
      
      # when current pointer reaches the end of the list,
      # 'nth_from_end' pointer will be 'n' from the end
      while !current.next.nil?
        current = current.next
        nth_from_end = nth_from_end.next
      end
      
      if nth_from_end
        return nth_from_end.data
      else
        return nil
      end
      
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
    new_node = Node.new(value)
    if @head
      current = @head
      while current.next
        current = current.next
      end
      current.next = new_node
    else
      @head = new_node
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
  