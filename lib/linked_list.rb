
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
      current = @head
      return nil if current.nil?
      max = current.data

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
    def find_min
      current = @head
      return nil if current.nil?
      min = current.data

      until current.nil?
        if current.data < min 
          min = current.data
        end 
        current = current.next
      end 

      return min
    end


    # method that returns the length of the singly linked list
    def length
      current = @head
      return 0 if current.nil?
      length = 0

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
      current = @head 
      length = 0
      
      until current.nil? 
        length += 1
        current = current.next
      end

      return nil if length < index 

      current = @head 
      index_value = current.data

      (index + 1).times do 
        index_value = current.data
        current = current.next
      end
  
      return index_value
    end

    # method to print all the values in the linked list
    def visit
      current = @head
      return nil if head.nil?
      
      until current.nil?
        p current.data
      end

    end

    # method to delete the first node found with specified value
    def delete(value)
      return nil if @head.nil?
      current = @head
      
      if current.data == value 
        return @head = current.next 
      end
      
      previous = nil
      continuing_node = nil
      
      until current.next.nil? || current.next.data == value 
        current = current.next
      end

      return nil if current.next.nil? 
      previous = current 
      continuing_node = previous.next.next
      previous.next = continuing_node
      
    end

    # method to reverse the singly linked list
    # note: the nodes should be moved and not just the values in the nodes
    def reverse
      previous = nil 
      current = @head 
      return nil if current.nil? 
      next_node = current.next
      current.next = nil
      

      until next_node.nil?
        previous = current
        current = next_node
        next_node = current.next 
        current.next = previous
      end

      @head = current
     
    end


    ## Advanced Exercises
    # returns the value at the middle element in the singly linked list
    def find_middle_value
      current = @head
      temp = current
      length = 0

      until current.nil?
        length += 1
        temp = temp.next
      end

      middle_node = nil
      (length / 2).times do 
        middle_node = current.data
        current = current.next
      end

      return middle_node
    end

    # find the nth node from the end and return its value
    # assume indexing starts at 0 while counting to n
    def find_nth_from_end(n)
      nth_node = nil 
      current = @head
      temp = @head 
      length = 0

      until temp.nil?
        length += 1
        temp = temp.next
      end

      (length - n).times do 
        nth_node = current.data 
        current = current.next
      end

      return nth_node
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
      current = @head 
      return nil if current.nil?
      return current.data
    end

    # method that inserts a given value as a new last node in the linked list
    def add_last(value)
      if !@head 
        @head = Node.new(value)
        return @head
      else
        current = @head
      end 

      until current.next.nil?
        current = current.next
      end 
      
      current.next = Node.new(value)

    end

    # method that returns the value of the last node in the linked list
    # returns nil if the linked list is empty
    def get_last
      current = @head 
      return nil if current.nil? 

      until current.next.nil?
        current = current.next
      end

      return current.data
    end

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
