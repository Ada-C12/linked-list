
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
      # raise NotImplementedError
      @head = Node.new(value, @head)
      
    end

    # method to find if the linked list contains a node with specified value
    # returns true if found, false otherwise
    def search(value)
      # raise 
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
      # raise NotImplementedError
      current = @head
      return nil if current.nil?

      
      max = @head
      
      until current.nil?
        if current.data > max.data
          max = current
        end
        current = current.next
      end

      return max.data
    end
   
    # method to return the min value in the linked list
    # returns the data value and not the node
    def find_min
      # raise NotImplementedError
      return nil if @head.nil?

      current = @head
      min = @head.data

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
      # raise NotImplementedError
      size = 0
      current = @head

      until current.nil?
        current = current.next
        size = size + 1
      end

    
      return size
    end

    # method that returns the value at a given index in the linked list
    # index count starts at 0
    # returns nil if there are fewer nodes in the linked list than the index value
    def get_at_index(index)
      # raise NotImplementedError
      current = @head

      index.times do 
        return nil if current.nil?
        current = current.next
      end
      return current.data
      
    end

    # method to print all the values in the linked list
    def visit
      # raise NotImplementedError
      current = @head

      until current.nil?
        print current.data
        current = current.next
      end
    end

    # method to delete the first node found with specified value
    def delete(value)
      # raise NotImplementedError
      current = @head
      return nil if current.nil?

      
      previous = nil

      until current.data == value
        return nil if current.nil?
        previous = current
        current = current.next
      end

      if previous.nil?
        @head = current.next
      else
        previous.next = current.next
      end
    end

    # method to reverse the singly linked list
    # note: the nodes should be moved and not just the values in the nodes
    def reverse
      # raise NotImplementedError
      return if @head.nil?

      current = @head
      previous = nil

      until current.next.nil?
        temp = current.next
        current.next = previous
        previous = current
        current = temp
      end
    current.next =  previous
    @head = current
    end



    ## Advanced Exercises
    # returns the value at the middle element in the singly linked list
    def find_middle_value
      # raise NotImplementedError
      length = self.length
      if length % 2 == 0
        value = (length / 2) - 1
      else
        value = (length / 2)
      end

    end

    # fast = @root
    # slow = @root
    # until fast.nil? 

    # find the nth node from the end and return its value
    # assume indexing starts at 0 while counting to n
    def find_nth_from_end(n)
      # raise NotImplementedError
      current = @head
      return nil if current.nil?

      
      nth_head = @head

      n.times do
        return nil if nth_head.next.nil?
        nth_head = nth_head.next
      end

      until nth_head.next.nil?
        return current.data if current.next.nil?
        current = current.next
        nth_head = nth_head.next
      end
      return current.data

      
    end

    # checks if the linked list has a cycle. A cycle exists if any node in the
    # linked list links to a node already visited.
    # returns true if a cycle is found, false otherwise.
    def has_cycle
      # raise NotImplementedError
      return if @head == nil
      
      current.next = @head
    end

    


    # Additional Exercises 
    # returns the value in the first node
    # returns nil if the list is empty
    def get_first
      # raise NotImplementedError
      if @head.nil?
        return nil
      else 
        return @head.data
      end
    end

    # method that inserts a given value as a new last node in the linked list
    def add_last(value)
      # raise NotImplementedError
      current = @head

      if current.nil?
        @head = Node.new(value)
        return @head
      end

      until current.next.nil?
        current = current.next
      end
      current.next = Node.new(value)
    end
    

    # method that returns the value of the last node in the linked list
    # returns nil if the linked list is empty
    def get_last
      # raise NotImplementedError
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
      # raise NotImplementedError
      return nil if @head.nil?

      current = @head
      if value < current.data
        self.first(value)
      end

      until current.next.nil?
        current_value = current.data
        next_value = current.next.data

        if value > current_value && value < next_value
          new_node = Node.new(value, current.next)
          current.next = new_node
          return
        end
        current = current.next
      end
      self.last(value)
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

# def has_cycle
# fast = @head.next
# fast = fast.next if fast
# slow = @head
 
# until fast.nil? || slow.nil
#   if fast == slow
#     return true
#   end
#   fast = fast.next
#   return true if fast == slow
#   fast = fast.next unless fast.nil?
#   slow = slow.next
# end
# end





