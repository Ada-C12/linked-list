
# Defines a node in the singly linked list
class Node
  attr_reader :value # allow external entities to read value but not write
  attr_accessor :next # allow external entities to read or write next node

  def initialize(value, next_node = nil)
    @value = value
    @next = next_node
  end
end

# Defines the singly linked list
class LinkedList
    def initialize
      @head = nil # keep the head private. Not accessible outside this class
      @tail = nil
    end

    # method to add a new node with the specific data value in the linked list
    # insert the new node at the beginning of the linked list
    def add_first(value)
      new_node = Node.new(value, nil)
      new_node.next = @head
      @head = new_node
    end

    # method to find if the linked list contains a node with specified value
    # returns true if found, false otherwise
    def search(value)
      if @head == nil
        return false
      end

      current = @head
      current_index = 0
      while current != nil
        if current.value == value
          return true
        else
          current = current.next
          current_index += 1
        end
      end

      return false
    end

    # method to return the max value in the linked list
    # returns the data value and not the node
    def find_max
      if @head == nil
        return nil
      end

      current = @head
      current_index = 0
      max_num = -1.0/0.0

      while current != nil
        if current.value > max_num
          max_num = current.value
        else 
          current = current.next
          current_index += 1
        end
      end

      return max_num
    end

    # method to return the min value in the linked list
    # returns the data value and not the node
    def find_min
      if @head == nil
        return nil
      end

      current = @head
      current_index = 0
      min_num = +1.0/0.0

      while current != nil
        if current.value < min_num
          min_num = current.value
        else 
          current = current.next
          current_index += 1
        end
      end

      return min_num
    end

    # method that returns the length of the singly linked list
    def length
      if @head == nil
        return 0
      end

      current = @head
      length = 1

      until current.next == nil
        current = current.next
        length += 1
      end

      return length
    end

    # method that returns the value at a given index in the linked list
    # index count starts at 0
    # returns nil if there are fewer nodes in the linked list than the index value
    def get_at_index(index)
      current = @head
      current_index = 0

      while current != nil
        if current_index == index
          return current.value
        else
          current_index += 1
          current = current.next
        end
      end
    end

    # method to print all the values in the linked list
    def visit
      if @head == nil
        return nil
      end

      current = @head
      while current.next != nil
        print(current.value)
        current = current.next
      end
    end

    # method to delete the first node found with specified value
    def delete(value)
      if @head == nil
        return nil
      end

      current = @head
      if @head.value == value
        @head = current.next
        return
      end

      while current.next != nil
        previous = current
        current = current.next
        if current.value == value
          previous.next = current.next
          if @tail == current
            @tail = previous
          end
          return
        end
      end
    end

    # method to reverse the singly linked list
    # note: the nodes should be moved and not just the values in the nodes
    def reverse
      current = @head
      previous = nil

      while current != nil
        track = current.next
        current.next = previous

        previous = current
        current = track
      end

      @head = previous
    end

    ## Advanced Exercises
    # returns the value at the middle element in the singly linked list
    def find_middle_value
      if @head == nil
        return nil
      end

      slow = @head
      fast = @head

      while fast != nil && fast.next != nil
        if fast.next.next == nil
          return slow.value
        end

        fast = fast.next.next
        slow = slow.next
      end

      return slow.value
    end

    # find the nth node from the end and return its value
    # assume indexing starts at 0 while counting to n
    def find_nth_from_end(n)
      current = @head
      index = 0

      while current != nil && index != n
        current = current.next
        index += 1
      end

      if current == nil
        return nil
      end

      new_current = @head
      while current.next != nil
        current = current.next
        new_current = new_current.next
      end
      return new_current.value
    end 

    # checks if the linked list has a cycle. A cycle exists if any node in the
    # linked list links to a node already visited.
    # returns true if a cycle is found, false otherwise.
    def has_cycle
      raise NotImplementedError
    end

    # # Additional Exercises 
    # # returns the value in the first node
    # # returns nil if the list is empty
    def get_first
      if @head == nil
        return nil
      else
        return @head.value
      end
    end

    # # method that inserts a given value as a new last node in the linked list
    def add_last(value)
      if @head == nil
        new_node = Node.new(value, nil)
        @head = new_node
      elsif @head != nil
        current = @head
        while current.next != nil
          current = current.next
        end

        new_node = Node.new(value, nil)
        current.next = new_node
        @tail = new_node
      end
    end

    # # method that returns the value of the last node in the linked list
    # # returns nil if the linked list is empty
    def get_last
      if @head == nil 
        return nil
      elsif @tail == nil
        return @head.value
      else
        return @tail.value
      end
    end

    # # method to insert a new node with specific data value, assuming the linked
    # # list is sorted in ascending order
    def insert_ascending(value)
      raise NotImplementedError
    end

    # # Helper method for tests
    # # Creates a cycle in the linked list for testing purposes
    # # Assumes the linked list has at least one node
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