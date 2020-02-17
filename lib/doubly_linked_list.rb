require_relative 'linked_list'
# *******  GOING FURTHER  *******

class DoublyNode
  attr_reader :data # allow external entities to read value but not write
  attr_accessor :next # allow external entities to read or write next node
  attr_accessor :previous

  def initialize(value, next_node = nil, previous_node = nil)
    @data = value
    @next = next_node
    @previous = previous_node
  end
end

# Using inheritance to utilize the methods of LinkedList that are the same.
class DoublyLinkedList < LinkedList
  def initialize
    @head = nil
  end

  def add_first(value)
    current = @head

    if @head.nil?
      @head = DoublyNode.new(value, @head)
      return
    else
      current.previous = DoublyNode.new(value, @head)
      @head = current.previous
    end
  end

  def add_last(value)
    if @head.nil?
      @head = DoublyNode.new(value, @head)
      return
    end

    current = @head

    until current.next.nil?
      current = current.next
    end

    current.next = DoublyNode.new(value, nil, current)
  end

  def reverse
    return if @head.nil?

    current = @head
    temp = nil

    until current.nil?
      temp = current.previous
      current.previous = current.next
      current.next = temp
      current = current.previous
    end

    if !temp.nil?
      @head = temp.previous
    end
  end

  def delete(value)
    return if @head.nil?
    if @head.data == value
      @head = @head.next
      @head.previous = nil
      return
    end

    current = @head

    until current.nil?
      if current.data == value
        previous = current.previous
        previous.next = current.next
        return
      else
        current = current.next
      end
    end
  end
end

