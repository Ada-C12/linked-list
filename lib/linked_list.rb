
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
  attr_reader :head

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
    if (@head == nil)
      return nil
    end
    current = @head
    temp_max = @head.data
    until current.nil?
      if current.data > temp_max
        temp_max = current.data
      end
      current = current.next
    end
    return temp_max
  end

  # method to return the min value in the linked list
  # returns the data value and not the node
  def find_min
    if @head.nil?
      return nil
    end
    current = @head
    temp_min = @head.data
    until current.nil?
      if current.data < temp_min
        temp_min = current.data
      end
      current = current.next
    end
    return temp_min
  end

  # method that returns the length of the singly linked list
  def length
    count = 0
    current = @head
    while current != nil
      count += 1
      current = current.next
    end
    return count
  end

  # method that returns the value at a given index in the linked list
  # index count starts at 0
  # returns nil if there are fewer nodes in the linked list than the index value
  def get_at_index(index)
    temp = @head
    count = 0
    while count < index && temp
      temp = temp.next
      count += 1
    end
    if (count == index)
      return temp.data
    else
      return nil
    end
  end

  # method to print all the values in the linked list
  def visit
    current = @head
    until current.nil?
      puts current.data
      current = current.next
    end
  end

  # method to delete the first node found with specified value
  def delete(value)
    return nil if @head.nil?

    current = @head
    prev = nil

    until current.data == value
      prev = current
      current = current.next
    end

    if prev.nil?
      @head = current.next
    else
      prev.next = current.next
    end
  end

  # method to reverse the singly linked list
  # note: the nodes should be moved and not just the values in the nodes
  def reverse
    if @head.nil?
      return @head
    end

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
  def find_middle_value
    raise NotImplementedError
  end

  # find the nth node from the end and return its value
  # assume indexing starts at 0 while counting to n
  def find_nth_from_end(n)
    current = @head
    n_counter = @head

    counter = 0

    n.times do
      if !n_counter.nil? && !n_counter.next.nil?
        n_counter = n_counter.next
      else
        return nil
      end
    end

    until n_counter.next.nil?
      n_counter = n_counter.next
      current = current.next
    end

    return current.data
  end

  # checks if the linked list has a cycle. A cycle exists if any node in the
  # linked list links to a node already visited.
  # returns true if a cycle is found, false otherwise.
  def has_cyclez
    current = @head
    fast_pt = current
    slow_pt = current

    until fast_pt.next.nil?
      if fast_pt == slow_pt
        return true
      end
      fast_pt = fast_pt.next
      fast_pt = fast_pt.next
      slow_pt = slow_pt.next
    end
    return false
  end

  # Additional Exercises
  # returns the value in the first node
  # returns nil if the list is empty
  def get_first
    if @head.nil?
      return nil
    else
      return @head.data
    end
  end

  # method that inserts a given value as a new last node in the linked list
  def add_last(value)
    temp = @head
    while temp != nil && temp.next != nil
      temp = temp.next
    end
    last_node = Node.new(value)

    if (temp != nil)
      temp.next = last_node
    else
      @head = last_node
    end

    return @head
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
