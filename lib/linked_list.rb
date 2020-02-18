
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

  #   new_node = Node.new(value)
  #   new_node.next = @head
  #   @head = new_node
  # end


  # method to find if the linked list contains a node with specified value
  # returns true if found, false otherwise
  def search(value)
    # raise NotImplementedError
    current_node = @head
    until current_node == nil
      if current_node.data == value
        return true
      end
      current_node = current_node.next
    end
    return false
  end

  # method to return the max value in the linked list
  # returns the data value and not the node

  def find_max
    # raise NotImplementedError
    current_node = @head
    if current_node == nil
      return nil
    else
      max = current_node.data
      until current_node == nil
        if current_node.data > max
          max = current_node.data
        end
        current_node = current_node.next
      end
      return max
    end
  end


  # method to return the min value in the linked list
  # returns the data value and not the node
  def find_min
    # raise NotImplementedError
    current_node = @head
    if current_node == nil
      return nil
    else
      min = current_node.data
      until current_node == nil
        if current_node.data < min
          min = current_node.data
        end
        current_node = current_node.next
      end
      return min
    end
  end


  # method that returns the length of the singly linked list
  def length
    # raise NotImplementedError
    return 0 if @head.nil?
    current_node = @head
    length = 0
    until current_node.nil?
      length += 1
      current_node = current_node.next
    end
    return length
  end
  # return 0 if @head.nil?
  #   current_node = @head
  #   length = 0
  #   while current_node != nil
  #     length += 1
  #     current_node = current_node.next
  #   end
  #   return length
  # end



  # method that returns the value at a given index in the linked list
  # index count starts at 0
  # returns nil if there are fewer nodes in the linked list than the index value
  def get_at_index(index)
    # raise NotImplementedError
    current_node = @head
    return nil if current_node.nil?
    index.times do 
      current_node = current_node.next
    end
    return current_node.data
  end

  # method to print all the values in the linked list
  def visit
    # raise NotImplementedError
    current_node = @head
    while current_node = current_node.next
      print current_node.data
    end
  end
  #   current_node = @head
  #   until current_node == nil
  #     print current_node.data
  #     current_node = current_node.next
  #   end
  # end


  # method to delete the first node found with specified value
  def delete(value)
    # raise NotImplementedError
  return nil if @head == nil
    
    current_node = @head
    if current_node.data == value
     @head = current_node.next
      return
    end
    until current_node == nil
      if current_node.next.data == value
        current_node.next = current_node.next.next
        return
      end
      current_node = current_node.next
    end
  end

  # method to reverse the singly linked list
  # note: the nodes should be moved and not just the values in the nodes
  def reverse
    # raise NotImplementedError
    return nil if @head.nil?
    current_node = @head
    # next_node = current_node.next
    # current_node.next = nil
    previous_node = nil
    until current_node == nil
      temp = current_node.next
      current_node.next = previous_node
      previous_node = current_node 
      current_node = temp
    end
    @head = previous_node
  end


  ## Advanced Exercises
  # returns the value at the middle element in the singly linked list
  def find_middle_value
    # raise NotImplementedError
    return nil if @head.nil?
    return @head.data if @head.next.nil?
    
    slow = @head
    fast = @head.next
    while fast!= nil
      solw = slow.next
      fast = fast.next
      if fast != nil
        fast = fast.next
      end 
    end 
    return slow.data
  end


  # find the nth node from the end and return its value
  # assume indexing starts at 0 while counting to n
  def find_nth_from_end(n)
    length = self.length
    return nil if n >= length
    i = length - n - 1
    return get_at_index(i)
  end 

 
  # checks if the linked list has a cycle. A cycle exists if any node in the
  # linked list links to a node already visited.
  # returns true if a cycle is found, false otherwise.
  def has_cycle
    # raise NotImplementedError
    return false if @head.nil?
    return false if @head.next.nil?
    slow = @head
    fast = @head
    while fast != nil
      slow = slow.next
      fast = fast.next
      if fast != nil
        fast = fast.next
      end 
        if fast == slow 
          return true #cycle detected
        end 
    end 
      return false
  end


  # Additional Exercises
  # returns the value in the first node
  # returns nil if the list is empty
  def get_first
    # raise NotImplementedError
    return nil if  @head.nil?
    return @head.data
  end
  # if @head != nil
  #  return @head.data
  # else
  #  return nil
  # end

  # method that inserts a given value as a new last node in the linked list
  def add_last(value)
    # raise NotImplementedError
     new_node = Node.new(value)
    if @head.nil?
      add_first(value)
    else
      current_node = @head
      while current_node.next != nil
        current_node = current_node.next
      end
      current_node.next = new_node
    end
  end
    # if @head == nil
    #   @head = Node.new(value)
    #   return
    # end
    # current_node = @head
    # until current_node.next.nil?
    #   current_node = current_node.next
    # end
    # current_node.next = Node.new(value)
# end
   

  # method that returns the value of the last node in the linked list
  # returns nil if the linked list is empty
  def get_last
    # raise NotImplementedError
    current_node = @head
    return nil if current_node.nil?
    while current_node.next != nil
      current_node = current_node.next
    end
    return current_node.data
  end 
  #   current_node = @head
  #   return nil if current_node == nil
  #   until current_node.next.nil?
  #     current_node = current_node.next
  #   end
  #   return current_node.data
  # end


  # method to insert a new node with specific data value, assuming the linked
  # list is sorted in ascending order
  def insert_ascending(value) 
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
