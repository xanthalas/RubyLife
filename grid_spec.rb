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
        Cell.reset
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

        test_array([nil, nil , nil, nil,  11, nil, 2, 12 ], neighbour_array).should == true
        #-------------------
        neighbour_array = grid.get_neighbours(4,4)
        neighbour_array.count.should == 8

        test_array([34, 44, 54, 35, 55, 36, 46, 56 ], neighbour_array).should == true
        #-------------------
        neighbour_array = grid.get_neighbours(0,1)
        neighbour_array.count.should == 8

        test_array([nil, 1, 11, nil, 12, nil, 3, 13 ], neighbour_array).should == true
        #-------------------
        neighbour_array = grid.get_neighbours(0,9)
        neighbour_array.count.should == 8

        test_array([nil, 9, 19, nil, 20, nil, nil, nil], neighbour_array).should == true
        #-------------------
        neighbour_array = grid.get_neighbours(5,0)
        neighbour_array.count.should == 8

        test_array([nil, nil, nil, 41, 61, 42, 52, 62 ], neighbour_array).should == true
        #-------------------
        neighbour_array = grid.get_neighbours(9,0)
        neighbour_array.count.should == 8

        test_array([nil, nil, nil, 81, nil, 82, 92, nil], neighbour_array).should == true
        #-------------------
        neighbour_array = grid.get_neighbours(8,3)
        neighbour_array.count.should == 8

        test_array([73, 83, 93, 74, 94, 75, 85, 95], neighbour_array).should == true
        #-------------------
        neighbour_array = grid.get_neighbours(4,9)
        neighbour_array.count.should == 8

        test_array([39, 49, 59, 40, 60, nil, nil, nil], neighbour_array).should == true
        #-------------------
        neighbour_array = grid.get_neighbours(0,4)
        neighbour_array.count.should == 8

        test_array([nil, 4, 14, nil, 15, nil, 6, 16], neighbour_array).should == true
        #-------------------
        neighbour_array = grid.get_neighbours(9,6)
        neighbour_array.count.should == 8

        test_array([86, 96, nil, 87, nil, 88, 98, nil], neighbour_array).should == true
        #-------------------
        neighbour_array = grid.get_neighbours(9,9)
        neighbour_array.count.should == 8

        test_array([89, 99, nil, 90, nil, nil, nil, nil], neighbour_array).should == true

    end
end

def test_array(expected_values, array_to_test)
    result = false
    expected_index = 0

    #puts "expected array = #{expected_values.each {|theid| puts theid}}"
    #puts "actual array   = #{array_to_test.each {|theid| puts theid}}"
    array_to_test.each {|value|
        if value == nil && expected_values[expected_index] != nil
            puts "Expected #{expected_values[expected_index]} but got #{value.id}"
            return false 
        end

        if value != nil && value.id != expected_values[expected_index]
            puts "Expected #{expected_values[expected_index]} but got #{value.id}"
            return false 
        end

        expected_index += 1
    }

    return true
end

describe "Loading a map file into the grid works" do
    it "Sets the correct cells to their starting position of alive or dead based on the contents of the map" do
        Cell.reset
        grid = Grid.new(10,10)

        grid.load_map("./maps/map1", 10, 10)

        grid.area[0][0].id.should == 1

        grid.area[0][0].alive.should == false
        grid.area[1][1].alive.should == true
        grid.area[2][1].alive.should == true
        grid.area[3][1].alive.should == true
        grid.area[1][4].alive.should == false
        grid.area[4][3].alive.should == true
        grid.area[4][4].alive.should == true
        grid.area[6][6].alive.should == false
        grid.area[6][7].alive.should == true
        grid.area[8][5].alive.should == false
        grid.area[9][8].alive.should == false
        grid.area[9][9].alive.should == true
    end
end

describe "Determine the status of each cell tomorrow and then start the new day" do
    it "Loads a map, moves on one generation (i.e. tomorrow) and then checks the cells" do
        Cell.reset
        grid = Grid.new(10,10)

        grid.load_map("./maps/map1", 10, 10)

        #puts "Before next_generation\n"
        output = ""
        for row in 0...grid.area.row_count
            for column in 0...grid.area.column_count
                cell = grid.area[column][row]
                if cell.alive?
                    output += "*"
                else
                    output += "."
                end
            end
            #puts output
            output = ""
        end

        grid.next_generation
        grid.generation.should == 2

        #puts "After next_generation\n"
        output = ""
        for row in 0...grid.area.row_count
            for column in 0...grid.area.column_count
                cell = grid.area[column][row]
                if cell.alive?
                    output += "*"
                else
                    output += "."
                end
            end
            #puts output
            output = ""
        end

        grid.area[0][0].alive.should == false
        grid.area[1][0].alive.should == false
        grid.area[2][0].alive.should == true
        grid.area[0][1].alive.should == false
        grid.area[1][1].alive.should == false
        grid.area[2][1].alive.should == true
        grid.area[0][3].alive.should == false
        grid.area[1][3].alive.should == false
        grid.area[2][3].alive.should == false
        grid.area[3][3].alive.should == false
        grid.area[0][4].alive.should == false
        grid.area[0][5].alive.should == false
        grid.area[0][6].alive.should == false
        grid.area[0][7].alive.should == true
        grid.area[0][8].alive.should == false
        grid.area[0][9].alive.should == false

        grid.area[0][1].alive.should == false
        grid.area[1][1].alive.should == false
        grid.area[2][1].alive.should == true
        grid.area[3][1].alive.should == false
        grid.area[4][1].alive.should == false
        grid.area[5][1].alive.should == false
        grid.area[6][1].alive.should == false
        grid.area[7][1].alive.should == false
        grid.area[8][1].alive.should == false
        grid.area[9][1].alive.should == false

    end
end
