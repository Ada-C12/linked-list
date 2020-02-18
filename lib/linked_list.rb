
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
      return find_node_and_previous_node(value).first
    end

    # method to return the max value in the linked list
    # returns the data value and not the node
    def find_max
      current = @head
      if current.nil?
        return nil
      else
        max = current.data
        while !current.next.nil?
          current = current.next
          max = current.data if (current.data > max)   
        end
        return max
      end
    end

    # method to return the min value in the linked list
    # returns the data value and not the node
    def find_min
      current = @head
      if current.nil?
        return nil
      else
        min = current.data
        while !current.next.nil?
          current = current.next
          min = current.data if (current.data < min)   
        end
        return min
      end
    end


    # method that returns the length of the singly linked list
    def length
      length = 0
      current = @head
      while !current.nil?
        length += 1
        current = current.next
      end
      return length
    end

    # method that returns the value at a given index in the linked list
    # index count starts at 0
    # returns nil if there are fewer nodes in the linked list than the index value
    def get_at_index(index)
      return nil if index > (length() - 1) || index < 0

      current = @head
      index.times do 
        current = current.next
      end
      return current.data
    end

    # method to print all the values in the linked list
    def visit
      current = @head
      while current
        puts current.data
        current = current.next
      end
    end

    # method to delete the first node found with specified value
    def delete(value)
      node_and_previous_node_pair = find_node_and_previous_node(value)
      if node_and_previous_node_pair.first
        previous = node_and_previous_node_pair[1]
        current = node_and_previous_node_pair[0]
        
        if !previous
          @head = current.next
        else
          previous.next = current.next 
        end
      end
    end

    # method to reverse the singly linked list
    # note: the nodes should be moved and not just the values in the nodes
    def reverse
      previous = nil 
      current = @head
      while current
        next_node = current.next
        
        current.next = previous
        previous = current
        current = next_node
      end
      
      @head = previous
    end


    ## Advanced Exercises
    # returns the value at the middle element in the singly linked list
    def find_middle_value
      return get_at_index((length() - 1 )/ 2)
    end

    # find the nth node from the end and return its value
    # assume indexing starts at 0 while counting to n
    def find_nth_from_end(n)
      return get_at_index(length() - 1 - n)
    end

    # checks if the linked list has a cycle. A cycle exists if any node in the
    # linked list links to a node already visited.
    # returns true if a cycle is found, false otherwise.
    def has_cycle
      single = @head
      if single && single.next && single.next.next
        double = single.next.next
        while single && double 
          return true if single == double
          2.times do 
            double = double.next
            return false if !double
          end
          single = single.next 
        end
      end
      return false
    end


    # Additional Exercises 
    # returns the value in the first node
    # returns nil if the list is empty
    def get_first
      return nil if !@head
      return @head.data
    end

    # method that inserts a given value as a new last node in the linked list
    def add_last(value)
      last_node = find_last_node
      if last_node
        last_node.next = Node.new(value)
      else
        @head = Node.new(value)
      end
    end

    # method that returns the value of the last node in the linked list
    # returns nil if the linked list is empty
    def get_last
      last_node = find_last_node()
      if last_node
        return last_node.data
      else
        return last_node
      end
    end

    # method to insert a new node with specific data value, assuming the linked
    # list is sorted in ascending order
    def insert_ascending(value)
      new_node = Node.new(value)
      if @head
        current = @head
        previous = nil

        while current
          break if current.data >= value
          previous = current
          current = current.next
        end 

        if previous
          previous.next = new_node
        else
          @head = new_node
        end 
        new_node.next = current
      else
        @head = new_node 
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
    
    private
    def find_last_node
      current = @head
      while current && current.next
        current = current.next
      end
      return current
    end
    
    def find_node_and_previous_node(value)
      current = @head

      if current && current.data == value
        return [current, nil]
      end
      
      while current && current.next
        previous = current
        current = current.next
        if current.data == value
          return [current, previous]
        end
      end  

      return [nil, nil]
    end
end
