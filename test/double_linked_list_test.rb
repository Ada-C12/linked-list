require 'minitest/autorun'
require 'minitest/reporters'
# require 'minitest/skip_dsl'

require_relative 'test_helper'


Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe DoublyLinkedList do
    # Arrange
    before do
        @double_list = DoublyLinkedList.new
    end

    describe 'initialize' do
        it 'can be created' do

            # Assert
            expect(@double_list).must_be_kind_of DoublyLinkedList
        end
    end

    describe 'add_first & get_first' do
        it 'can add values to an empty list' do
            # Act
            @double_list.add_first(3)

            # Assert
            expect(@double_list.get_first).must_equal 3
        end

        it 'will put the last added item to the front of the list' do
            # Act
            @double_list.add_first(1)
            @double_list.add_first(2)

            # Assert
            expect(@double_list.get_first).must_equal 2

            # Act again
            @double_list.add_first(3)

            # Assert
            expect(@double_list.get_first).must_equal 3
        end

        it 'will return `nil` for `getFirst` if the list is empty' do

            expect(@double_list.get_first).must_be_nil
        end
    end

    describe "length" do
        it "will return 0 for an empty list" do
            expect(@double_list.length).must_equal 0
        end

        it "will return the length for nonempty lists" do
            count = 0
            while count < 5
                @double_list.add_first(count)
                count += 1
                expect(@double_list.length).must_equal count
            end
        end
    end

    describe "addLast & getLast" do
        it "will add to the front if the list is empty" do
            @double_list.add_last(1)
            expect(@double_list.get_first).must_equal 1
        end

        it "will put new items to the rear of the list" do
            @double_list.add_last(2)
            expect(@double_list.length).must_equal 1
            expect(@double_list.get_last).must_equal 2

            @double_list.add_last(3)
            expect(@double_list.get_first).must_equal 2
            expect(@double_list.get_last).must_equal 3
            expect(@double_list.length).must_equal 2

            @double_list.add_last(4)
            expect(@double_list.get_first).must_equal 2
            expect(@double_list.get_last).must_equal 4
            expect(@double_list.length).must_equal 3
        end
    end

    describe 'get_at_index' do
        it 'returns nil if the index is outside the bounds of the list' do
            expect(@double_list.get_at_index(3)).must_be_nil
        end

        it 'can retrieve an item at an index in the list' do
            @double_list.add_first(1)
            @double_list.add_first(2)
            @double_list.add_first(3)
            @double_list.add_first(4)

            expect(@double_list.get_at_index(0)).must_equal 4
            expect(@double_list.get_at_index(1)).must_equal 3
            expect(@double_list.get_at_index(2)).must_equal 2
            expect(@double_list.get_at_index(3)).must_equal 1
        end
    end

    describe "nth_from_the_end" do
        it 'returns nil if n is outside the bounds of the list' do
            expect(@double_list.find_nth_from_end(3)).must_be_nil
        end

        it 'can retrieve an item at index n from the end in the list' do
            @double_list.add_first(1)
            @double_list.add_first(2)
            @double_list.add_first(3)
            @double_list.add_first(4)

            expect(@double_list.find_nth_from_end(0)).must_equal 1
            expect(@double_list.find_nth_from_end(1)).must_equal 2
            expect(@double_list.find_nth_from_end(2)).must_equal 3
            expect(@double_list.find_nth_from_end(3)).must_equal 4
            expect(@double_list.find_nth_from_end(4)).must_be_nil
        end
    end

    # describe "delete" do
    #     it "delete from empty linked list is a no-op" do
    #         expect(@double_list.length).must_equal 0
    #         @double_list.delete(4)
    #         expect(@double_list.length).must_equal 0
    #     end

    #     it "can delete valid values from list" do
    #         @double_list.add_last(9)
    #         @double_list.add_last(10)
    #         @double_list.add_first(4)
    #         @double_list.add_first(3)
    #         @double_list.add_first(2)

    #         # delete fist node (requires updating head)
    #         @double_list.delete(2)
    #         expect(@double_list.get_first).must_equal 3
    #         expect(@double_list.length).must_equal 4
    #         expect(@double_list.get_last).must_equal 10

    #         # delete last node
    #         @double_list.delete(10)
    #         expect(@double_list.get_first).must_equal 3
    #         expect(@double_list.length).must_equal 3
    #         expect(@double_list.get_last).must_equal 9

    #         # delete fist node (requires updating head)
    #         @double_list.delete(4)
    #         expect(@double_list.get_first).must_equal 3
    #         expect(@double_list.length).must_equal 2
    #         expect(@double_list.get_last).must_equal 9
    #     end
    # end

    

    # describe "reverse" do
    #     it 'can retrieve an item at index n from the end in the list' do
            # @double_list.add_first(4)
            # @double_list.add_first(3)
            # @double_list.add_first(2)
            # @double_list.add_first(1)
            # @double_list.reverse

            # expect(@double_list.find_nth_from_end(0)).must_equal 1
            # expect(@double_list.find_nth_from_end(1)).must_equal 2
            # expect(@double_list.find_nth_from_end(2)).must_equal 3
            # expect(@double_list.find_nth_from_end(3)).must_equal 4
    #     end
    # end
end
