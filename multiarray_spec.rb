##########################################################################################
# Program: rubylife                                                                      #
# Author : Xanthalas                                                                     #
# Class  : n/a                                                                           #
# File   : multiarray_spec.rb                                                            #
#        : RSpec tests for the MultiArray class.                                         #
##########################################################################################

require './multiarray'
require './cell'

describe "initialize" do
    it "Check that initialiser works correctly" do
        ma = Multiarray.new(5, 6)
        ma.column_count.should == 5
        ma.row_count.should == 6
    end
end

describe "get_cell" do
    it "returns the correct cell" do
        ma = Multiarray.new(2, 3)
        index = 0
        ma.populate_array { 
            index += 10
        }
        ma.get_cell(0,0).should == 10
        ma.get_cell(0,1).should == 20
        ma.get_cell(0,2).should == 30
        ma.get_cell(1,0).should == 40
        ma.get_cell(1,1).should == 50
        ma.get_cell(1,2).should == 60
        ma.get_cell(4,2).should == nil
    end
end

describe "populate_array" do
    it "ensures that the cells are correctly initialised" do
        ma = Multiarray.new(2, 3)
        ma.populate_array { Cell.new(true) }

        ma.get_cell(1, 2).class.should eq Cell
    end
end

describe "set_cell" do
    it "correctly sets a cell to a new value" do
        ma = Multiarray.new(2, 3)
        index = 0
        ma.populate_array { 
            index += 10
        }
        ma.get_cell(0,2).should == 30

        ma.set_cell(0,2, 99)

        ma.get_cell(0,2).should == 99

        #Ensure that it doesn't care if you try and set a cell which doesn't exist
        ma.set_cell(10, 15, "Hello")
    end
end

