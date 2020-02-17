require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require_relative 'test_helper'


Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe DoublyLinkedList do
  # Arrange
  before do
    @list = DoublyLinkedList.new
  end

  describe 'initialize' do
    it 'can be created' do
      # Assert
      expect(@list).must_be_kind_of DoublyLinkedList
    end
  end

  describe "add first and get first" do
    it "can add values to an empty list" do
      @list.add_first(5)

      expect(@list.get_first).must_equal 5
    end

    it "will put the last added item to the front of the list" do
      @list.add_first(1)
      @list.add_first(2)

      expect(@list.get_first).must_equal 2
    end

    it "will return nil if the list is empty" do
      expect(@list.get_first).must_be_nil
    end
  end

  describe "add last and get last" do
    it "will add to the front if the list is empty" do
      @list.add_last(1)
      expect(@list.get_first).must_equal 1
    end

    it "will put new items to the rear of the list" do
      @list.add_last(2)
      @list.add_last(3)
      @list.add_last(4)

      expect(@list.get_last).must_equal 4
    end
  end

  describe 'get_at_index' do
    it 'returns nil if the index is outside the bounds of the list' do
      expect(@list.get_at_index(3)).must_be_nil
    end

    it 'can retrieve an item at an index in the list' do
      @list.add_first(1)
      @list.add_first(2)
      @list.add_first(3)
      @list.add_first(4)

      expect(@list.get_at_index(0)).must_equal 4
      expect(@list.get_at_index(1)).must_equal 3
      expect(@list.get_at_index(2)).must_equal 2
      expect(@list.get_at_index(3)).must_equal 1
    end
  end

  describe "reverse" do
    it 'can successfully reverse a list' do
      @list.add_first(4)
      @list.add_first(3)
      @list.add_first(2)
      @list.add_first(1)
      @list.reverse

      expect(@list.get_at_index(0)).must_equal 4
      expect(@list.get_at_index(1)).must_equal 3
      expect(@list.get_at_index(2)).must_equal 2
      expect(@list.get_at_index(3)).must_equal 1
    end
  end

  describe "delete" do
    it "can delete valid values from list" do
      @list.add_last(2)
      @list.add_last(3)
      @list.add_last(4)
      @list.add_last(5)
      @list.add_last(6)

      # delete first node (requires updating head)
      @list.delete(2)
      expect(@list.get_first).must_equal 3
      expect(@list.get_last).must_equal 6

      # delete last node
      @list.delete(6)
      expect(@list.get_first).must_equal 3
      expect(@list.get_last).must_equal 5

      # delete middle node
      @list.delete(4)
      expect(@list.get_first).must_equal 3
      expect(@list.get_last).must_equal 5
    end
  end
end
