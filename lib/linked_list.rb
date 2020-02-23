
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
      if @head != nil
        current = @head
        @head = Node.new(value, current)
      else
        @head = Node.new(value)
      end
    end

    # method to find if the linked list contains a node with specified value
    # returns true if found, false otherwise
    def search(value)
      if @head.nil?
        return false
      end

      current = @head

      until current.nil?
        if current.data == value
          return true
        end
        current = current.next
      end
        return false

    end

    # method to return the max value in the linked list
    # returns the data value and not the node
    def find_max
      current = @head

      if current.nil?
        return nil
      end

      max_value = @head.data
      until current.nil?
        if current.data > max_value
          max_value = current.data
        end
        current = current.next
      end

      return max_value
    end

    # method to return the min value in the linked list
    # returns the data value and not the node
    def find_min
      current = @head

      if current.nil?
        return nil
      end

      min_value = @head.data
      until current.nil?
        if current.data < min_value
          min_value = current.data
        end
        current = current.next
      end

      return min_value

    end


    # method that returns the length of the singly linked list
    def length
      current = @head

      len = 0
      until current.nil?
        len += 1
        current = current.next
      end

      return len
    end

    # method that returns the value at a given index in the linked list
    # index count starts at 0
    # returns nil if there are fewer nodes in the linked list than the index value
    def get_at_index(index)
      if @head == nil
        return nil
      end

      current = @head
      result = @head 
      length = 0
      until current.nil?
        length += 1
        current = current.next
      end

      if index > (length - 1)
        return nil
      else
        (index).times do
          result = result.next
        end
        return result.data
      end

      
    end

    # method to print all the values in the linked list
    def visit
      current = @head

      until current.nil?
        print current.data
        current = current.next
      end
    end

    # method to delete the first node found with specified value
    def delete(value)
      current = @head

      if current.nil?
        return nil
      end
    
      if current.data == value
        @head = @head.next
      else 
        previous_node = current
        next_node = current.next
        until next_node.nil?
          if next_node.data == value
            previous_node.next = next_node.next
            return
          end
          previous_node = next_node
          next_node = next_node.next
        end
      end
    end

    # method to reverse the singly linked list
    # note: the nodes should be moved and not just the values in the nodes
    def reverse

      return if @head.nil?

      current = @head
      next_node = current.next

      @head.next = nil 

      until next_node.nil?
        temp = next_node.next
        next_node.next = current
        current = next_node
        next_node = temp
      end

      @head = current


    end


    ## Advanced Exercises
    # returns the value at the middle element in the singly linked list
    def find_middle_value
      current = @head
      result = @head

      if current.nil?
        return nil
      end

      length = 0
      until current.nil?
        length += 1
        current = current.next
      end

      mid_el = length/2 
      
      if length.even?
        mid_el += 1
      end
      
      mid_el.times do
        result = result.next
      end

      return result.data

    end

    # find the nth node from the end and return its value
    # assume indexing starts at 0 while counting to n
    def find_nth_from_end(n)
      i = @head
      j = @head

      outside_bound = false
      n.times do
        if j != nil
          j = j.next
        else
          outside_bound = true
        end
      end

      if outside_bound == true || j == nil
        return nil
      end

      until j.next == nil
        i = i.next
        j = j.next
      end

      return i.data
    end

    # checks if the linked list has a cycle. A cycle exists if any node in the
    # linked list links to a node already visited.
    # returns true if a cycle is found, false otherwise.
    def has_cycle
      return if @head == nil

      i = @head
      j = @head.next

      until j.nil?
        i = i.next
        j = j.next

        if j == i || j.next == i
          return true
        else
          j = j.next
        end
      end

      return false

    end


    # Additional Exercises 
    # returns the value in the first node
    # returns nil if the list is empty
    def get_first
      current = @head

      if @head.nil?
        return nil
      else
        return @head.data
      end
    end

    # method that inserts a given value as a new last node in the linked list
    def add_last(value)
      if @head == nil
        @head = Node.new(value)
      else
        current = @head 
        while current.next != nil
          current = current.next
        end

        last_node = Node.new(value)
        current.next = last_node
      end
    end

    # method that returns the value of the last node in the linked list
    # returns nil if the linked list is empty
    def get_last
      if @head.nil?
        return nil
      end

      current = @head 
      while current.next != nil
        current = current.next
      end

      return current.data

    end

    # method to insert a new node with specific data value, assuming the linked
    # list is sorted in ascending order
    def insert_ascending(value)
      return if @head == nil

      current = @head
      next_node = current.next
      
      new_node = Node.new(value)

      if new_node.data < current.data
        new_node.next = current
      end

      while next_node != nil
        if (current < new_node.data) && (next_node.data > new_node.data)
          current.next = new_node
          new_node.next = next_node
        end
          current = current.next
          next_node = next_node.next
      end

      if current.data < new_node.data
        current.next = current
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
