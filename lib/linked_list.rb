
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
      # circular linked list, therefore @head point to itself
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
      # 1. if linked list is empty:
      return nil if @head.nil?

      # 2. if not empty:
      max = @head.data
      upcoming = @head.next

      until upcoming.nil?
        max = upcoming.data if upcoming.data > max
        upcoming = upcoming.next
      end

      return max
    end

    # method to return the min value in the linked list
    # returns the data value and not the node
    def find_min
      # 1. if linked list is empty:
      return nil if @head.nil?

      # 2. if not empty:
      min = @head.data
      upcoming = @head.next

      until upcoming.nil?
        min = upcoming.data if upcoming.data < min
        upcoming = upcoming.next
      end

      return min
    end


    # method that returns the length of the singly linked list
    def length
      length = 0
      current = @head

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
      # rule out input error: index > length || index < 0
      return nil if index > self.length || index < 0
      
      current = @head
      index.times do
        current = current.next
      end

      return current.data
    end

    # method to print all the values in the linked list
    def visit
      # if linked list is empty:
      return nil if @head.nil?
      
      current = @head
      until current.nil?
        # p instead of return to continue the loop
        p current.data
        current = current.next
      end
    end

    # method to delete the first node found with specified value
    def delete(value)
      # if linked list is empty:
      return nil if @head.nil?
      
      current = @head
      @head = @head.next if current.data == value

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
      # nothing to be reversed if list is empty or only has one node:
      return if @head.nil? || @head.next.nil?

      current = @head
      prev = nil

      until current.nil?
        temp = current.next
        current.next = prev
        prev = current
        current = temp
      end

      @head = prev
    end


    ## Advanced Exercises
    # returns the value at the middle element in the singly linked list
    def find_middle_value
      return nil if @head.nil?

      slow = @head
      fast = @head.next

      until fast.nil?
        slow = slow.next
        fast = fast.next.next
      end

      return slow.data
    end

    # find the nth node from the end and return its value
    # assume indexing starts at 0 while counting to n
    def find_nth_from_end(n)
      return nil if @head.nil? || self.length < n
      
      slow = @head
      fast = @head

      (n - 1).times do
        fast = fast.next
      end 

      until fast.next.nil?
        slow = slow.next
        fast = fast.next
      end

      return slow.data
    end

    # checks if the linked list has a cycle. A cycle exists if any node in the
    # linked list links to a node already visited < different def than circular LI >
    # returns true if a cycle is found, false otherwise.
    def has_cycle
      return false if @head.nil?
      
      slow = @head.next
      fast = @head.next.next

      until fast.nil?
        return true if fast == slow
        fast = fast.next
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
      # 1. if list is empty:
      self.add_first(value) if @head.nil?

      # 2. if not empty:
      curr = @head
      (self.length - 1).times do
        curr = curr.next
      end
      curr.next = Node.new(value)
    end

    # method that returns the value of the last node in the linked list
    # returns nil if the linked list is empty
    def get_last
      return nil if @head.nil?
      
      curr = @head
      until curr.next.nil?
        curr = curr.next
      end

      return curr.data
    end

    # method to insert a new node with specific data value, assuming the linked
    # list is sorted in ascending order
    def insert_ascending(value)
      @head = Node.new(value) if @head.nil?

      if @head.data > value
        temp = @head
        @head = Node.new(value)
        @head.next = temp
      else
        curr = @head 
        until curr.nil?
          if value >= curr.data
            new = Node.new(value,curr.next.next)
            curr.next = new
            return
          end
          curr = curr.next
        end
      end
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
