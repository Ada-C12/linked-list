class DoublyNode
    attr_reader :data
    attr_accessor :next, :previous
    
    def initialize(value)
        @data = value
        @next = nil
        @previous = nil
    end
end

class DoublyLinkedList
    def initialize
        @head = nil
        @tail = nil
        @size = 0
    end
    
    def length
        return @size
        # raise NotImplementedError
    end
    
    def add_first(value)
        new_node = DoublyNode.new(value)
        
        if @head
            @head.previous = new_node
            new_node.next = @head
        else
            @tail = new_node
        end
        @head = new_node
        @size += 1
    end
    
    def add_last(value)
        new_node = DoublyNode.new(value)
        
        if @tail
            @tail.next = new_node
            new_node.previous = @tail
        else
            @head = new_node
        end
        @tail = new_node
        @size += 1
    end
    
    def get_first
        return @head.data if @head
        return @head
    end
    
    def get_last
        return @tail.data if @tail
        return @tail
    end
    
    def get_at_index(index)
        if @head && index < @size && index >= 0
            current = @head
            count = 0
            while count < index
                current = current.next
                count += 1
            end
            return current.data
        end
        return nil
    end
    
    def reverse
        if @head
            @tail = @head
            current = @head
            while current
                previous_node = current.previous
                current.previous = current.next
                current.next = previous_node
                @head = current
                current = current.previous 
            end
        end
    end
    
    def delete(value)
        current = @head
        while current
            if current.data == value
                previous_node = current.previous
                next_node = current.next
                
                if previous_node
                    previous_node.next = next_node
                else
                    @head = next_node
                end
                
                if next_node 
                    next_node.previous = previous_node
                else
                    @tail = previous_node
                end
                
                @size -= 1
                break
            end
            current = current.next
        end
    end
    
end