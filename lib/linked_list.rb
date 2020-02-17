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
      @head = Node.new(value, @head)
    end

    # method to find if the linked list contains a node with specified value
    # returns true if found, false otherwise
    # Time Complexity: O(n) where n is number of nodes in list
    # Space Complexity: O(1)
    def search(value)
      return false if @head.nil?

      current = @head
      until current.nil? do
        return true if current.data == value
        current = current.next
      end
      return false
    end

    # method to return the max value in the linked list
    # returns the data value and not the node
    # Time Complexity: O(n) where n is number of nodes in list
    # Space Complexity: O(1)
    def find_max
      return nil if @head.nil?

      current = @head
      max = @head.data

      until current.nil? do
        max = current.data if current.data > max
        current = current.next
      end

      return max
    end

    # method to return the min value in the linked list
    # returns the data value and not the node
    # Time Complexity: O(n) where n is number of nodes in list
    # Space Complexity: O(1)
    def find_min
      return nil if @head.nil?

      current = @head
      min = @head.data
      
      until current.nil? do
        min = current.data if current.data < min
        current = current.next
      end

      return min
    end


    # method that returns the length of the singly linked list
    # Time Complexity: O(n) where n is number of nodes in list
    # Space Complexity: O(1)
    def length
      length = 0
      return length if @head.nil?

      current = @head
      until current.nil? do
        length += 1
        current = current.next
      end
      return length
    end

    # method that returns the value at a given index in the linked list
    # index count starts at 0
    # returns nil if there are fewer nodes in the linked list than the index value
    # Time Complexity: O(n) where n is number of nodes in list
    # Space Complexity: O(1)
    def get_at_index(index)
      return nil if @head.nil?

      current = @head
      count = 0
      until current.nil? do
        return current.data if count == index 
        current = current.next
        count += 1
      end
      return nil
    end

    # method to print all the values in the linked list
    # Time Complexity: O(n) where n is number of nodes in list
    # Space Complexity: O(1)
    def visit
      return nil if @head.nil?

      current = @head
      until current.nil? do
        if current.next.nil?
          print "#{current.data}"
        else
          print "#{current.data} -> "
        end
        current = current.next
      end
    end

    # method to delete the first node found with specified value
    # Time Complexity: O(n) where n is number of nodes in list
    # Space Complexity: O(1)
    def delete(value)
      return nil if @head.nil?

      previous = nil
      current = @head

      until current.nil? do
        if current.data == value
          if previous.nil?
            @head = current.next
          else
            previous.next = current.next
          end
          return
        end
        previous = current
        current = current.next
      end
    end

    # method to reverse the singly linked list
    # note: the nodes should be moved and not just the values in the nodes
    # Time Complexity: O(n) where n is number of nodes in list
    # Space Complexity: O(1)
    def reverse
      return nil if @head.nil?

      previous_node = nil
      current_node = @head
      until current_node.nil? do
        next_node = current_node.next 
        current_node.next = previous_node
        
        previous_node = current_node
        current_node = next_node
      end

      @head = previous_node
    end


    ## Advanced Exercises
    # returns the value at the middle element in the singly linked list
    def find_middle_value
      return nil if @head.nil?

      fast_pointer = @head
      slow_pointer = @head

      until fast_pointer.next.nil? do
        fast_pointer = fast_pointer.next
        fast_pointer = fast_pointer.next if !fast_pointer.next.nil?
        slow_pointer = slow_pointer.next
      end

      return slow_pointer.data
    end

    # find the nth node from the end and return its value
    # assume indexing starts at 0 while counting to n
    # Time Complexity: O(n) where n is number of nodes in list
    # Space Complexity: O(1)
    def find_nth_from_end(n)
      return nil if @head.nil?
      pointer_A = @head
      pointer_B = @head

      counter = 0
      until pointer_A.next.nil? do
          pointer_B = pointer_B.next if counter >= n
          pointer_A = pointer_A.next
          counter += 1
      end
      
      if counter < n 
          return nil
      else
          return pointer_B.data
      end
    end

    # checks if the linked list has a cycle. A cycle exists if any node in the
    # linked list links to a node already visited.
    # returns true if a cycle is found, false otherwise.
    # Time Complexity: O(n) where n is number of nodes in list
    # Space Complexity: O(1)
    def has_cycle
      return nil if @head.nil?

      if @head.next
        fast_pointer = @head.next
        slow_pointer = @head
      else
        return false
      end

      until slow_pointer.nil? do
        return true if slow_pointer == fast_pointer
        
        fast_pointer = fast_pointer.next if !fast_pointer.nil?
        fast_pointer = fast_pointer.next if !fast_pointer.nil?
        slow_pointer = slow_pointer.next
      end

      return false
    end

    # Additional Exercises 
    # returns the value in the first node
    # returns nil if the list is empty
    # Time Complexity: O(1)
    # Space Complexity: O(1)
    def get_first
      return nil if @head.nil?
      return @head.data
    end

    # method that inserts a given value as a new last node in the linked list
    # Time Complexity: O(n) where n is number of nodes in list
    # Space Complexity: O(1)
    def add_last(value)
      if @head.nil?
        add_first(value)
        return
      end

      current = @head
      until current.next.nil? do
        current = current.next
      end

      new_end = Node.new(value)
      current.next = new_end
    end

    # method that returns the value of the last node in the linked list
    # returns nil if the linked list is empty
    # Time Complexity: O(n) where n is number of nodes in list
    # Space Complexity: O(1)
    def get_last
      return nil if @head.nil?

      current = @head
      until current.next.nil? do
        current = current.next
      end
      return current.data
    end

    # method to insert a new node with specific data value, assuming the linked
    # list is sorted in ascending order
    # Time Complexity: O(n) where n is number of nodes in list
    # Space Complexity: O(1)
    def insert_ascending(value)
      return add_first(value) if @head.nil?

      
      if @head.data >= value
        @head = Node.new(value, @head)
        return
      end
      
      current = @head
      until current.nil? do
        if current.next.nil? || current.next.data >= value
          current.next = Node.new(value, current.next)
          return
        else
          current = current.next
        end
      end
    end

    # Helper method for tests
    # Creates a cycle in the linked list for testing purposes
    # Assumes the linked list has at least one node
    # Time Complexity: O(n) where n is number of nodes in list
    # Space Complexity: O(1)
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