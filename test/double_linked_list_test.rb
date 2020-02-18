# These tests are rewrites of the linked_list_test.rb content provided in this exercise

require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'

require_relative 'test_helper'


Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe DoubleLinkedList do
  
  before do
    @dlist = DoubleLinkedList.new
  end
  
  describe "initialize" do
    it "can be created" do
      expect(@dlist).must_be_kind_of DoubleLinkedList
    end
  end
  
  describe "add_first and get_first" do
    
    it "will return nil if the list is empty" do
      expect(@dlist.get_first).must_be_nil
    end
    
    it "will put the last added item at the front of the list" do
      @dlist.add_first(1)
      @dlist.add_first(2)
      expect(@dlist.get_first).must_equal 2
      expect(@dlist.length).must_equal 2
      
      @dlist.add_first(3)
      expect(@dlist.get_first).must_equal 3
      expect(@dlist.length).must_equal 3
      
    end
    
  end
  
  describe "length" do
    it "returns 0 if the list is empty" do
      expect(@dlist.length).must_equal 0
    end
    
    it "returns an accurate length for the list" do  
      @dlist.add_first(1)
      @dlist.add_first(2)
      @dlist.add_first(3)
      expect(@dlist.length).must_equal 3
    end
  end
  
  describe "add_last and get_last" do
    it "will add to the front of the list if the list is empty" do
      @dlist.add_last(1)
      expect(@dlist.get_last).must_equal 1
    end
    
    it "will add to the end of the list" do
      @dlist.add_last(2)
      expect(@dlist.length).must_equal 1
      expect(@dlist.get_last).must_equal 2
      
      @dlist.add_last(3)
      expect(@dlist.get_first).must_equal 2
      expect(@dlist.get_last).must_equal 3
      expect(@dlist.length).must_equal 2
      
      @dlist.add_last(4)
      expect(@dlist.get_first).must_equal 2
      expect(@dlist.get_last).must_equal 4
      expect(@dlist.length).must_equal 3
    end
  end
  
  describe "get_at_index(index)" do
    it 'returns nil if the index is outside the bounds of the list' do
      expect(@dlist.get_at_index(3)).must_be_nil
    end
    
    it 'can retrieve an item at an index in the list' do
      @dlist.add_first(1)
      @dlist.add_first(2)
      @dlist.add_first(3)
      @dlist.add_first(4)
      
      expect(@dlist.get_at_index(0)).must_equal 4
      expect(@dlist.get_at_index(1)).must_equal 3
      expect(@dlist.get_at_index(2)).must_equal 2
      expect(@dlist.get_at_index(3)).must_equal 1
    end
  end
  
  describe "find_nth_from_end(index)" do
    it 'returns nil if n is outside the bounds of the list' do
      expect(@dlist.find_nth_from_end(3)).must_be_nil
    end
    
    it 'can retrieve an item at index n from the end in the list' do
      @dlist.add_first(1)
      @dlist.add_first(2)
      @dlist.add_first(3)
      @dlist.add_first(4)
      
      expect(@dlist.find_nth_from_end(0)).must_equal 1
      expect(@dlist.find_nth_from_end(1)).must_equal 2
      expect(@dlist.find_nth_from_end(2)).must_equal 3
      expect(@dlist.find_nth_from_end(3)).must_equal 4
      expect(@dlist.find_nth_from_end(4)).must_be_nil
    end
  end
  
  describe "reverse" do
    it 'can retrieve an item at index n from the end in the list' do
      @dlist.add_first(4)
      @dlist.add_first(3)
      @dlist.add_first(2)
      @dlist.add_first(1)
      
      @dlist.view
      puts "******"
      @dlist.reverse
      puts "******"
      @dlist.view
      puts "______"
      
      expect(@dlist.find_nth_from_end(0)).must_equal 1
      expect(@dlist.find_nth_from_end(1)).must_equal 2
      expect(@dlist.find_nth_from_end(2)).must_equal 3
      expect(@dlist.find_nth_from_end(3)).must_equal 4
    end
  end
  
  xdescribe "delete(value)" do 
    it "returns nil if the desired value is not in the list or the lsit is empty" do
      expect(@dlist.delete(1)).must_be_nil
      
      @dlist.add_first(1)
      expect(@dlist.delete(2)).must_be_nil
    end
    
    it "deletes the desired value" do
      @dlist.add_first(1)
      @dlist.add_first(3)
      @dlist.add_first(5)
      
      expect(@dlist.length).must_equal 3
      @dlist.delete(3)
      
      expect(@dlist.length).must_equal 2
      expect(@dlist.get_first).must_equal 5
      expect(@dlist.get_last).must_equal 1
    end
  end
  
end