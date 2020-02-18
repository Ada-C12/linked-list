require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'

require_relative 'test_helper'

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe DoublyLinkedList do
    before do 
        @list = DoublyLinkedList.new
    end

    describe 'initialize'  do
        it 'can be created' do
            # Assert
            expect(@list).must_be_kind_of DoublyLinkedList
        end
    end
  

    describe 'add_first' do
        @list.add_first(1)
    end 

    describe 'add_last' do

    end 

    describe 'get_first' do

    end

    describe 'get_at_index(index)' do
    end

    decribe 'reverse' do
    end

    describe 'delete(value)' do
    end
end

