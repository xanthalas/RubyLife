##########################################################################################
# Program: rubylife                                                                      #
# Author : Xanthalas                                                                     #
# Class  : n/a                                                                           #
# File   : grid_spec.rb                                                                  #
#        : RSpec tests for the Grid class.                                               #
##########################################################################################

require './grid'

describe "initialize" do
   it "Initialises the grid with the correct number of rows and columns" do
        grid = Grid.new(20,10)
        grid.area.column_count.should == 20
        grid.area.row_count.should == 10
    end
end

describe "Ensure that the grid is completely filled with cells" do
    it "Initialises a 5x5 grid and ensure it is filled with cells" do
        grid = Grid.new(5,5)
        valid = true
        grid.area.each{|cell| 
            cell.class.should == Cell
        }

        grid.next_generation
    end
end

describe "get_neighbours" do
    it "Retrieves all the neighbours for the given cell" do
        Cell.reset
        grid = Grid.new(10,10)

        neighbour_array = grid.get_neighbours(0,0)
        neighbour_array.count.should == 8

        neighbour_array[0].should == nil
        neighbour_array[1].should == nil
        neighbour_array[2].should == nil 
        neighbour_array[3].should == nil
        neighbour_array[4].id.should == 2
        neighbour_array[5].should == nil
        neighbour_array[6].id.should == 11
        neighbour_array[7].id.should == 12 
        #-------------------
        neighbour_array = grid.get_neighbours(4,4)
        neighbour_array.count.should == 8

        neighbour_array[0].id.should == 34
        neighbour_array[1].id.should == 35
        neighbour_array[2].id.should == 36
        neighbour_array[3].id.should == 44
        neighbour_array[4].id.should == 46
        neighbour_array[5].id.should == 54
        neighbour_array[6].id.should == 55
        neighbour_array[7].id.should == 56 
        #-------------------
        neighbour_array = grid.get_neighbours(0,1)
        neighbour_array.count.should == 8

        neighbour_array[0].should == nil
        neighbour_array[1].id.should == 1
        neighbour_array[2].id.should == 2
        neighbour_array[3].should == nil
        neighbour_array[4].id.should == 12
        neighbour_array[5].should == nil
        neighbour_array[6].id.should == 21
        neighbour_array[7].id.should == 22 
        #-------------------
        neighbour_array = grid.get_neighbours(0,9)
        neighbour_array.count.should == 8

        neighbour_array[0].should == nil
        neighbour_array[1].id.should == 81
        neighbour_array[2].id.should == 82
        neighbour_array[3].should == nil
        neighbour_array[4].id.should == 92
        neighbour_array[5].should == nil
        neighbour_array[6].should == nil
        neighbour_array[7].should == nil
        #-------------------
        neighbour_array = grid.get_neighbours(5,0)
        neighbour_array.count.should == 8

        neighbour_array[0].should == nil
        neighbour_array[1].should == nil
        neighbour_array[2].should == nil
        neighbour_array[3].id.should == 5
        neighbour_array[4].id.should == 7
        neighbour_array[5].id.should == 15
        neighbour_array[6].id.should == 16
        neighbour_array[7].id.should == 17 
        #-------------------
        neighbour_array = grid.get_neighbours(9,0)
        neighbour_array.count.should == 8

        neighbour_array[0].should == nil
        neighbour_array[1].should == nil
        neighbour_array[2].should == nil
        neighbour_array[3].id.should == 9
        neighbour_array[4].should == nil
        neighbour_array[5].id.should == 19
        neighbour_array[6].id.should == 20
        neighbour_array[7].should == nil
        #-------------------
        neighbour_array = grid.get_neighbours(8,3)
        neighbour_array.count.should == 8

        neighbour_array[0].id.should == 28
        neighbour_array[1].id.should == 29
        neighbour_array[2].id.should == 30
        neighbour_array[3].id.should == 38
        neighbour_array[4].id.should == 40
        neighbour_array[5].id.should == 48
        neighbour_array[6].id.should == 49
        neighbour_array[7].id.should == 50
        #-------------------
        neighbour_array = grid.get_neighbours(4,9)
        neighbour_array.count.should == 8

        neighbour_array[0].id.should == 84
        neighbour_array[1].id.should == 85
        neighbour_array[2].id.should == 86
        neighbour_array[3].id.should == 94
        neighbour_array[4].id.should == 96
        neighbour_array[5].should == nil
        neighbour_array[6].should == nil
        neighbour_array[7].should == nil
        #-------------------
        neighbour_array = grid.get_neighbours(0,4)
        neighbour_array.count.should == 8

        neighbour_array[0].should == nil
        neighbour_array[1].id.should == 31
        neighbour_array[2].id.should == 32
        neighbour_array[3].should == nil
        neighbour_array[4].id.should == 42
        neighbour_array[5].should == nil
        neighbour_array[6].id.should == 51
        neighbour_array[7].id.should == 52
        #-------------------
        neighbour_array = grid.get_neighbours(9,6)
        neighbour_array.count.should == 8

        neighbour_array[0].id.should == 59
        neighbour_array[1].id.should == 60
        neighbour_array[2].should == nil
        neighbour_array[3].id.should == 69
        neighbour_array[4].should == nil
        neighbour_array[5].id.should == 79
        neighbour_array[6].id.should == 80
        neighbour_array[7].should == nil
        #-------------------
        neighbour_array = grid.get_neighbours(9,9)
        neighbour_array.count.should == 8

        neighbour_array[0].id.should == 89
        neighbour_array[1].id.should == 90
        neighbour_array[2].should == nil
        neighbour_array[3].id.should == 99
        neighbour_array[4].should == nil
        neighbour_array[5].should == nil
        neighbour_array[6].should == nil
        neighbour_array[7].should == nil
        
    end
end
