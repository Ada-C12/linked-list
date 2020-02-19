# doubly_linked_list.rb
class Node 
    attr_reader :data # allow external entities to read value but not write
    attr_accessor :next # allow external entities to read or write next node
    attr_accessor :previous # allow external entities to read or write previous node

    def initialize(value, next_node = nil, previous_node = nil)
      @data = value
      @next = next_node
      @previous = previous_node
    end
end

class DoublyLinkedList 

    def initialize
        @head = nil
    end

    def add_first(value)
        if @head.nil?
            @head = Node.new(value, nil, nil)
        else
            old_head = @head
            @head = Node.new(value, old_head, nil)
            old_head.previous_node = @head
        end
    end


    def add_last
    end
 
    def get_first
    end

    def get_at_index(index)
    end

    def reverse
    end

    def delete(value)
    end

end