class DoublyLinkedListNode
  attr_reader :data 
  attr_accessor :next 
  attr_accessor :prev 


  def initialize(value, next_node = nil, prev_node = nil)
    @data = value
    @next = next_node
    @prev = prev_node
  end
end

class DoublyLinkedList
    def initialize
      @head = nil 
      @tail = nil
    end

    # method to add a new node with the specific data value in the linked list
    # insert the new node at the beginning of the linked list
    def add_first(value)
      new_node = DoublyLinkedListNode.new(value, @head, nil)

      @tail = new_node if @head.nil?
      @head = new_node
    end

    # Time Complexity: O(1) the method does not need to visit each node of the list
    # Space Complexity: O(1) because the amount of values stored does not increase with linked list size
    # method that inserts a given value as a new last node in the linked list
    def add_last(value)
      if @head.nil?
        @head = DoublyLinkedListNode.new(value, nil, nil)
        return
      end

      current_last = @tail
      new_node = Node.new(value, nil, current_last)
      current_last.next = new_node
      return
    end

    # Time Complexity: O(1) because the algorithm takes the same amount of time with any linked list size
    # Space Complexity: O(1) because the amount of values stored does not increase with linked list size
    # returns the value in the first node
    # returns nil if the list is empty
    def get_first
      return nil if @head.nil?

      return @head.data
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

    # Time Complexity: O(1) the time the method takes to run does not depend on list size
    # Space Complexity: O(1) because the amount of values stored does not increase with linked list size
    # method to reverse the doubly linked list
    # note: the nodes should be moved and not just the values in the nodes
    def reverse
      return nil if @head.nil?

      temp_head = @head

      @head = @tail
      @tail = temp_head
    end

    # Time Complexity: O(n) the method must visit each node of the list, so the method is dependant on list size
    # Space Complexity: O(1) because the amount of values stored does not increase with linked list size
    # method to delete the first node found with specified value
    def delete(value)
      return 0 if @head.nil?

      current = @head

      if current.data == value
        @head = current.next
        @head.prev = nil
        return
      end

      prev_node = nil
      next_node = nil

      until current.next.nil?
        if current.data == value
          prev_node = current.prev
          next_node = current.next
          prev_node.next = next_node
          next_node.prev = prev_node
        end
      end

      if current.data == value
        @tail = current.prev
        @tail.next = nil
      end
    end
end