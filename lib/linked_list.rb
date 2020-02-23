
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
        if @head.nil?
            return nil
        end

        until @head.nil?
            if @head.data == value
                return true
            else
                @head = @head.next
            end
        end
        return false
    end


    # method to return the max value in the linked list
    # returns the data value and not the node
    def find_max
  
        return nil if @head.nil?
        current = @head
        max = current

        until current.nil?
            if max.data < current.data
                max = current
                current = current.next
            end
        end
        return max.data
    end

    # method to return the min value in the linked list
    # returns the data value and not the node
    def find_min

        return nil if @head.nil?

        current = @head
        min = current

        until current.nil?
            if min.data > current.data
                min.data = current.data
                current = current.next
            end
        end
        return min.data
    end


    # method that returns the length of the singly linked list
    def length
      if @head.nil? 
        return 0
      end
      
      current = @head
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
 

    # method to print all the values in the linked list
    def visit
        return nil if @head.nil?
        current = @head

        until current.nil?
            print current.value
            current = current.next
        end
        
    end

    # method to delete the first node found with specified value
    def delete(value)

        return nil if @head.nil?
        current = @head
        previous = nil

        until current.nil?
            if current.data == value
                previous.next = current.next
                exit
            else
                previous = current
                current = current.next
            end
        end  

    end

    # method to reverse the singly linked list
    # note: the nodes should be moved and not just the values in the nodes
    def reverse
        current = @head
        previous = nil
        until current.nil?
          temp = current.next
          current.next = previous
          previous = current
          current = temp
        end
    
        @head = previous
    end

    ## Advanced Exercises
    # returns the value at the middle element in the singly linked list
    def find_middle_value
      raise NotImplementedError
    end

    # find the nth node from the end and return its value
    # assume indexing starts at 0 while counting to n
    def find_nth_from_end(n)
      raise NotImplementedError
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
      raise NotImplementedError
    end

    # method that inserts a given value as a new last node in the linked list
    def add_last(value)
      raise NotImplementedError
    end

    # method that returns the value of the last node in the linked list
    # returns nil if the linked list is empty
    def get_last
      raise NotImplementedError
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
