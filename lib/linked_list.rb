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
    # Time: O(1)
    # Space: O(1)
    def add_first(value)
      new_node = Node.new(value)
      new_node.next = @head
      @head = new_node
    end

    # method to find if the linked list contains a node with specified value
    # returns true if found, false otherwise
    # Time: O(n) - you might have to check all nodes
    # Space: O(1)
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
    # Time: O(n) - n is the length of the list
    # Space: O(1)
    def find_max
      return nil if @head.nil?

      max = @head.data
      current = @head

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
    # Time: O(n) - n is the length of the list
    # Space: O(1)
    def find_min
      return nil if @head.nil?

      min = @head.data
      current = @head

      until current.nil?
        if current.data < min
          min = current.data
        end
        current = current.next
      end

      return min
    end

    # method that returns the length of the singly linked list
    # Time: O(n) - n is the length of the list
    # Space: O(1)
    def length
      length = 0
      return length if @head.nil?

      current = @head

      until current.nil?
        current = current.next
        length += 1
      end

      return length
    end

    # method that returns the value at a given index in the linked list
    # index count starts at 0
    # returns nil if there are fewer nodes in the linked list than the index value
    # Time: O(n)
    # Space: O(1)
    def get_at_index(index)
      count = 0

      current = @head

      until count == index
        return nil if current.nil?
        current = current.next
        count += 1
      end

      return current.data
    end

    # method to print all the values in the linked list
    # Time: O(n) - n is the length of the list
    # Space: O(1)
    def visit
      current = @head
      
      until current.nil?
        print "#{current.data} "
        current = current.next
      end
    end

    # method to delete the first node found with specified value
    # Time: O(n) - you might have to check each node
    # Space: O(1)
    def delete(value)
      return nil if @head.nil?
      
      current = @head

      if current.data == value
        @head = current.next
      end

      until current.next.nil?
        if current.next.data == value
          current.next = current.next.next
          return
        end
        current = current.next
      end
    end

    # method to reverse the singly linked list
    # note: the nodes should be moved and not just the values in the nodes
    # Time: O(n) - n is the length of the list
    # Space: O(1)
    def reverse
      return nil if @head.nil?

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

      return @head
    end

    ## Advanced Exercises
    # returns the value at the middle element in the singly linked list
    # Time: O(n)
    # Space: O(1)
    def find_middle_value
      return if @head.nil?

      slow = @head
      fast = @head.next

      until fast.nil? || fast.next.nil?
        slow = slow.next
        fast = fast.next.next
      end

      return slow.data
    end

    # find the nth node from the end and return its value
    # assume indexing starts at 0 while counting to n
    # Time: O(n) 
    # Space: O(1)
    def find_nth_from_end(n)
      return nil if @head.nil?

      current = @head
      k_ahead = @head
    
      n.times do
        return if k_ahead.next.nil?
        k_ahead = k_ahead.next
      end
    
      until k_ahead.next.nil?
        current = current.next
        k_ahead = k_ahead.next
      end
    
      return current.data
    end

    # checks if the linked list has a cycle. A cycle exists if any node in the
    # linked list links to a node already visited.
    # returns true if a cycle is found, false otherwise.
    # Time: O(n)
    # Space: O(1)
    def has_cycle
      return false if @head.nil? || @head.next.nil?

      slow = @head
      fast = @head

      while fast
        slow = slow.next
        fast = fast.next

        if fast
          fast = fast.next

          if fast == slow
            return true
          end
        end
      end
      
      return false
    end

    # Additional Exercises 
    # returns the value in the first node
    # returns nil if the list is empty
    # Time: O(1)
    # Space: O(1)
    def get_first
      return nil if @head.nil?

      return @head.data
    end

    # method that inserts a given value as a new last node in the linked list
    # Time: O(n)
    # Space: O(1)
    def add_last(value)
      if @head.nil?
        return @head = Node.new(value)
      end

      current = @head

      until current.next.nil?
        current = current.next
      end

      new_node = Node.new(value)
      current.next = new_node      
    end

    # method that returns the value of the last node in the linked list
    # returns nil if the linked list is empty
    # Time: O(n)
    # Space: O(1)
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
    # Time: O(n)
    # Space: O(1) 
    def insert_ascending(value)
      if @head.nil? || @head.data > value
        new_node = Node.new(value)
        new_node.next = @head
        @head = new_node
        return
      end

      current = @head

      until current.next.nil?
        if current.next.data > value
          new_node = Node.new(value)
          new_node.next = current.next
          current.next = new_node
          return
        end
        current = current.next
      end

      current.next = Node.new(value)
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
