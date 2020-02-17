class DoubleNode
    attr_accessor :data, :next, :previous
  
    def initialize(data, next_node, previous_node)
        @data = data
        @next = next_node
        @previous = previous_node
    end
  end

# Defines the doubly linked list
class DoublyLinkedList
    def initialize
        @head = nil
        @tail = nil
    end

    def add_first(data)
        if @head.nil?
            @head = DoubleNode.new(data, @head, nil)
            @tail = @head
        elsif @head.next.nil?
            new_head = DoubleNode.new(data, @head, nil)
            @tail = @head
            @head.previous = new_head
            @head = new_head
        else
            new_head = DoubleNode.new(data, @head, nil)
            @head.previous = new_head
            @head = new_head
        end
    end

    def add_last(data)
        if @head.nil?
            add_first(data)
            return
        end

        new_end = DoubleNode.new(data, nil, @tail)
        @tail.next = new_end
        @tail = new_end
    end

    def get_first
        return nil if @head.nil?
        return @head.data
    end

    def get_last
        return nil if @head.nil?
        return @tail.data
    end

    def length
        return 0 if @head.nil?

        current = @head
        count = 1
        until current.next.nil? do
            count += 1 
            current = current.next
        end
        return count
    end

    def get_at_index(index)
        return nil if @head.nil?

        current = @head
        count = 0
        until current.nil? do
            return current.data if count == index
            count += 1
            current = current.next
        end
        return nil
    end

    def reverse
        return nil if @head.nil?
          
        current_node = @head
        until current_node.next.nil? do
          next_node = current_node.next 
          current_node.next = current_node.previous
          
          current_node = next_node
        end
  
        @head = current_node
      end

    def delete(data)
        return nil if @head.nil?
        current = @head

        until current.next.nil? do
            if current.data == data
                current.previous.next = current.next
                current.next.previous = current.previous
            end
            current = current.next
        end
    end
end


