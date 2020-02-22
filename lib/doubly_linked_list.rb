# Defines a node in the doubly linked list
class DoubleNode
  attr_reader :data # allow external entities to read value but not write
  attr_accessor :previous, :next # allow external entities to read or write previous or next node

  def initialize(value, previous_node = nil, next_node = nil)
    @data = value
    @previous = previous_node
    @next = next_node
  end
end

# Defines the doubly linked list
class DoublyLinkedList
  def initialize
    @head = nil # keep the head private. Not accessible outside this class
  end

  # method to add a new node with the specific data value in the linked list
  # insert the new node at the beginning of the linked list
  # Time: O(1)
  # Space: O(1)
  def add_first(value)
    new_node = DoubleNode.new(value, nil, @head)

    if @head
      @head.previous = new_node
    end

    @head = new_node
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

  # method to delete the first node found with specified value
  # Time: O(n) to find the node, but O(1) to delete it
  # Space: O(1)
  def delete(value)
    return nil if @head.nil?

    current = @head

    if current.data == value
      @head = current.next
      @head.previous = nil
      return
    end

    until current.next.nil?
      if current.next.data == value
        temp = current.next.next
        current.next = temp
        if temp
          temp.previous = current
        end
        return
      end
      current = current.next
    end
  end

  # method to reverse the doubly linked list
  # note: the nodes should be moved and not just the values in the nodes
  # Time: O(n)
  # Space: O(1)
  def reverse
    return nil if @head.nil?

    current = @head

    until current.next.nil?
      temp = current.next
      current.next = current.previous
      current.previous = temp
      current = temp
    end

    current.next = current.previous
    current.previous = nil
    @head = current

    return @head
  end

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
      return @head = DoubleNode.new(value)
    end

    current = @head

    until current.next.nil?
      current = current.next
    end

    new_node = DoubleNode.new(value, current, nil)
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
end
