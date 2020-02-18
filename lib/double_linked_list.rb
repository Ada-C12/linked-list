# Defines a node in the double linked list
class Node
  attr_reader :data
  attr_accessor :next
  attr_accessor :prev
  
  def initialize(value, next_node = nil, previous_node = nil)
    @data = value
    @next = next_node
    @prev = previous_node
  end
end

class DoubleLinkedList
  
  def initialize
    @head = nil
  end 
  
  def add_first(value)
    current = @head
    temp = Node.new(value)
    if current == nil
      @head = temp
    else
      temp.next = current
      current.prev = temp
      @head = temp
    end
  end
  
  def get_first
    current = @head
    if current == nil
      return nil
    else
      return current.data
    end
  end
  
  def length
    current = @head
    if current == nil
      return 0
    end
    
    length = 1
    
    until current.next == nil do
      current = current.next
      length += 1  
    end
    
    return length 
    
  end
  
  def add_last(value)
    # create a new node
    temp = Node.new(value) 
    
    # set current
    current = @head
    
    # shortcut for an empty list
    if current == nil
      add_first(value)
      return
    elsif current.next == nil
      current.next = temp
      temp.prev = current
      return
    end
    
    # increment current to pentultimate node
    until current.next == nil do
      current = current.next
    end
    
    current.next = temp
    temp.prev = current
    
  end
  
  def get_last
    current = @head
    
    if current == nil
      return nil
    end
    
    until current.next == nil do
      current = current.next
    end
    
    return current.data
  end
  
  def get_at_index(index)
    current = @head
    
    if current == nil 
      return nil
    elsif index == 0
      return current.data
    end
    
    counter = 0
    
    until current.next == nil do
      if counter == index
        return current.data
      else
        current = current.next
        counter += 1
      end
    end
    
    if index > counter 
      return nil
    else
      return current.data
    end
    
  end
  
  def find_nth_from_end(index) 
    current = @head
    
    if current == nil
      return nil
    end
    
    length = 0
    # get current to the end
    until current.next == nil do
      current = current.next
      length += 1
    end
    
    # see if the index value is longer than the list
    if index > length
      return nil
    elsif index == 0
      return current.data
    end
    
    #hop back
    counter = 0
    until counter == index do
      current = current.prev
      counter += 1
    end
    
    return current.data
  end
  
  def reverse
    current = @head
    
    if current == nil || current.next == nil
      return
    end
    
    hopper = @head
    
    until hopper.next == nil do
      hopper = hopper.next
    end
    
    @head = current
    
    return
    
  end
  
  def delete(value)
  end
  
  def view
    current = @head
    
    if current == nil
      return
    end
    
    until current.next == nil
      puts current.data
      current = current.next
    end
    puts current.data
    
  end
  
end
