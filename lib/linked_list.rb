
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

    # Time Complexity: O(1) because the algorithm takes the same amount of time with any linked list size
    # Space Complexity: O(1) because the amount of values stored does not increase with linked list size
    # method to add a new node with the specific data value in the linked list
    # insert the new node at the beginning of the linked list
    def add_first(value)
      new_node = Node.new(value, @head)
      @head = new_node
    end

    # Time Complexity: O(n) in worst case the search will iterate through the entire list to find the value, so the method is dependant on list size
    # Space Complexity: O(1) because the amount of values stored does not increase with linked list size
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

    # Time Complexity: O(n) the method must search each value of the list, so the method is dependant on list size
    # Space Complexity: O(1) because the amount of values stored does not increase with linked list size
    # method to return the max value in the linked list
    # returns the data value and not the node
    def find_max
      return nil if @head.nil?

      current = @head
      max = current.data

      until current.nil?
        max = current.data if current.data > max
        
        current = current.next
      end

      return max
    end

    # Time Complexity: O(n) the method must search each value of the list, so the method is dependant on list size
    # Space Complexity: O(1) because the amount of values stored does not increase with linked list size
    # method to return the min value in the linked list
    # returns the data value and not the node
    def find_min
      return nil if @head.nil?

      current = @head
      min = current.data

      until current.nil?
        min = current.data if current.data < min

        current = current.next
      end

      return min
    end

    # Time Complexity: O(n) the method must search each value of the list, so the method is dependant on list size
    # Space Complexity: O(1) because the amount of values stored does not increase with linked list size
    # method that returns the length of the singly linked list
    def length
      return 0 if @head.nil?

      count = 0
      current = @head

      until current.nil?
        current = current.next
        count += 1
      end

      return count
    end

    # Time Complexity: O(n) in worst case the search will iterate through the entire list to find the value, so the method is dependant on list size
    # Space Complexity: O(1) because the amount of values stored does not increase with linked list size
    # method that returns the value at a given index in the linked list
    # index count starts at 0
    # returns nil if there are fewer nodes in the linked list than the index value
    def get_at_index(index)
      if (index > (self.length - 1) || @head.nil?)
        return nil
      end

      current = @head

      index.times do
        current = current.next
      end

      return current.data

    end

    # Time Complexity: O(n) the method must search each value of the list, so the method is dependant on list size
    # Space Complexity: O(1) because the amount of values stored does not increase with linked list size
    # method to print all the values in the linked list
    def visit
      return 0 if @head.nil?

      current = @head

      until current.nil?
        puts "#{current.data}"
        current = current.next
      end
    end

    # Time Complexity: O(n) the method must visit each node of the list, so the method is dependant on list size
    # Space Complexity: O(1) because the amount of values stored does not increase with linked list size
    # method to delete the first node found with specified value
    def delete(value)
      return 0 if @head.nil?

      current = @head

      if current.data == value
        @head = current.next
        return
      end

      prev = nil

      until current.data == value
        prev = current
        current = current.next
      end

      prev.next = current.next
    end

    # Time Complexity: O(n) the method must visit each node of the list, so the method is dependant on list size
    # Space Complexity: O(1) because the amount of values stored does not increase with linked list size
    # method to reverse the singly linked list
    # note: the nodes should be moved and not just the values in the nodes
    def reverse
      return nil if @head.nil?

      current = @head
      prev = nil

      until current.next.nil?
        temp_pointer = current.next

        current.next = prev
        prev = current
        current = temp_pointer
      end

      @head = current
      current.next = prev
      prev = current
    end


    ## Advanced Exercises
    # Time Complexity: O(n) the method must visit each node of the list, so the method is dependant on list size
    # Space Complexity: O(1) because the amount of values stored does not increase with linked list size
    # returns the value at the middle element in the singly linked list
    def find_middle_value
      return false if @head.nil? || @head.next.nil?

      slow = @head
      fast = @head.next

      until fast.nil?
        slow = slow.next
        fast = fast.next
        fast = fast.next unless fast.nil?
      end

      return slow.data
    end

    # Time Complexity: O(n) the method must visit each node of the list, so the method is dependant on list size
    # Space Complexity: O(1) because the amount of values stored does not increase with linked list size
    # find the nth node from the end and return its value
    # assume indexing starts at 0 while counting to n
    def find_nth_from_end(n)
      return nil if n > (self.length - 1) || @head.nil?

      k_ahead = @head
      current = @head

      n.times do 
        k_ahead = k_ahead.next
      end

      until k_ahead.next.nil?
        current = current.next
        k_ahead = k_ahead.next
      end

      return current.data
    end

    # Time Complexity: O(n) the method must visit each node of the list, so the method is dependant on list size
    # Space Complexity: O(1) because the amount of values stored does not increase with linked list size
    # checks if the linked list has a cycle. A cycle exists if any node in the
    # linked list links to a node already visited.
    # returns true if a cycle is found, false otherwise.
    def has_cycle
      return false if @head.nil? || @head.next.nil?

      slow = @head
      fast = @head

      until fast.nil?
        slow = slow.next
        fast = fast.next
        fast = fast.next unless fast.nil?

        return true if fast == slow
      end

      return false
    end


    # Additional Exercises 
    # Time Complexity: O(1) because the algorithm takes the same amount of time with any linked list size
    # Space Complexity: O(1) because the amount of values stored does not increase with linked list size
    # returns the value in the first node
    # returns nil if the list is empty
    def get_first
      return nil if @head.nil?

      return @head.data
    end

    # Time Complexity: O(n) the method must visit each node of the list, so the method is dependant on list size
    # Space Complexity: O(1) because the amount of values stored does not increase with linked list size
    # method that inserts a given value as a new last node in the linked list
    def add_last(value)
      if @head.nil?
        @head = Node.new(value, nil)
        return
      end

      current = @head

      (self.length - 1).times do 
        current = current.next
      end

      new_node = Node.new(value, nil)
      current.next = new_node
      return
    end

    # Time Complexity: O(n) the method must visit each node of the list, so the method is dependant on list size
    # Space Complexity: O(1) because the amount of values stored does not increase with linked list size
    # method that returns the value of the last node in the linked list
    # returns nil if the linked list is empty
    def get_last
      return nil if @head.nil?

      current = @head

      until current.next.nil?
        current = current.next
      end

      return current.data
    end

    # Time Complexity: O(n) In the worst case the method must visit each node of the list, so the method is dependant on list size
    # Space Complexity: O(1) because the amount of values stored does not increase with linked list size
    # method to insert a new node with specific data value, assuming the linked
    # list is sorted in ascending order
    def insert_ascending(value)
      return nil if @head.nil? || @head.next.nil?

      current = @head

      if value < current.data
        self.add_first(value)
        return
      end

      until current.next.nil?
        current_value = current.data
        next_value = current.next.data

        if (value > current_value && value < next_value)
          new_node = Node.new(value, current.next)

          current.next = new_node
          return
        end

        current = current.next
      end

      self.add_last(value)
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
