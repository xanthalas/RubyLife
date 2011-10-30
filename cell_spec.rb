##########################################################################################
# Program: rubylife                                                                      #
# Author : Xanthalas                                                                     #
# Class  : n/a                                                                           #
# File   : cell_spec.rb                                                                  #
#        : RSpec tests for the Cell class.                                               #
##########################################################################################

require './cell'

describe Cell do
    describe "#alive?" do
        it "returns true for a cell which is alive" do
            cell = Cell.new(true)
            cell.alive?.should == true
        end
    end

    describe "#last_updated for new cell" do
        it "returns the value of the last generation in which it was updated" do
            cell = Cell.new(true)
            cell.iteration_last_updated.should == 0;
        end
    end

    describe "#iteration last_updated for existing cell" do
        it "returns a +1 last_updated value when determine_tomorrow is called" do
            cell = Cell.new(true)

            neighbour_array = Array.new

            neighbour_array[0] = Cell.new(false)
            neighbour_array[1] = Cell.new(false)

            cell.determine_tomorrow(neighbour_array)
            cell.iteration_last_updated.should == 1
        end
    end

    #Live cell tests
    describe "#determine_tomorrow" do
        it "returns false for alive? when a live cell has less than two neighbours" do
            neighbour_array = Array.new

            neighbour_array[0] = Cell.new(true)
            neighbour_array[1] = Cell.new(false)
            neighbour_array[2] = Cell.new(false)
            maincell = Cell.new(true)

            maincell.determine_tomorrow(neighbour_array)
            maincell.alive_tomorrow?.should == false
        end
    end

    describe "#determine_tomorrow" do
        it "returns true for alive? when a live cell has exactly two live neighbours" do
            maincell = Cell.new(true)

            neighbour_array = Array.new

            neighbour_array[0] = Cell.new(true)
            neighbour_array[1] = Cell.new(false)
            neighbour_array[2] = Cell.new(true)

            maincell.determine_tomorrow(neighbour_array)
            maincell.alive_tomorrow?.should == true
        end
    end

    describe "#determine_tomorrow" do
        it "returns true for alive? when a live cell has exactly three live neighbours" do
            maincell = Cell.new(true)

            neighbour_array = Array.new

            neighbour_array[0] = Cell.new(true)
            neighbour_array[1] = Cell.new(false)
            neighbour_array[2] = Cell.new(true)
            neighbour_array[3] = Cell.new(true)

            maincell.determine_tomorrow(neighbour_array)
            maincell.alive_tomorrow?.should == true
        end
    end

    describe "#determine_tomorrow" do
        it "returns false for alive? when a live cell has exactly four live neighbours" do
            maincell = Cell.new(true)

            neighbour_array = Array.new

            neighbour_array[0] = Cell.new(false)
            neighbour_array[1] = Cell.new(true)
            neighbour_array[2] = Cell.new(true)
            neighbour_array[3] = Cell.new(false)
            neighbour_array[4] = Cell.new(true)
            neighbour_array[5] = Cell.new(true)

            maincell.determine_tomorrow(neighbour_array)
            maincell.alive_tomorrow?.should == false
        end
    end

    describe "#determine_tomorrow" do
        it "returns false for alive? when a live cell has exactly eight live neighbours" do
            maincell = Cell.new(true)

            neighbour_array = Array.new

            8.times { neighbour_array << Cell.new(true) }

            maincell.determine_tomorrow(neighbour_array)
            maincell.alive_tomorrow?.should == false
        end
    end

    describe "#determine_tomorrow" do
        it "returns false for alive? when all a live cell's neighbours are nil" do
            maincell = Cell.new(true)

            neighbour_array = Array.new

            8.times { neighbour_array << nil }

            maincell.determine_tomorrow(neighbour_array)
            maincell.alive_tomorrow?.should == false
        end
    end
   
    
    #Dead cell tests

    describe "#determine_tomorrow" do
        it "returns false for alive? when a dead cell has less than three neighbours" do
            neighbour_array = Array.new

            neighbour_array[0] = Cell.new(true)
            neighbour_array[1] = Cell.new(false)
            neighbour_array[2] = Cell.new(false)
            maincell = Cell.new(false)

            maincell.determine_tomorrow(neighbour_array)
            maincell.alive_tomorrow?.should == false
        end
    end

    describe "#determine_tomorrow" do
        it "returns false for alive? when a dead cell has more than three neighbours" do
            neighbour_array = Array.new

            neighbour_array[0] = Cell.new(true)
            neighbour_array[1] = Cell.new(false)
            neighbour_array[2] = Cell.new(false)
            neighbour_array[3] = Cell.new(true)
            neighbour_array[4] = Cell.new(true)
            neighbour_array[5] = Cell.new(true)
            maincell = Cell.new(false)

            maincell.determine_tomorrow(neighbour_array)
            maincell.alive_tomorrow?.should == false
        end
    end

    describe "#determine_tomorrow" do
        it "returns true for alive? when a dead cell has exactly three neighbours" do
            neighbour_array = Array.new

            neighbour_array[0] = Cell.new(true)
            neighbour_array[1] = Cell.new(true)
            neighbour_array[2] = Cell.new(true)
            maincell = Cell.new(false)

            maincell.determine_tomorrow(neighbour_array)
            maincell.alive_tomorrow?.should == true
        end
    end

    describe "#determine_tomorrow" do
        it "returns false for alive? when all a dead cell's neighbours are nil" do
            maincell = Cell.new(false)

            neighbour_array = Array.new

            8.times { neighbour_array << nil }

            maincell.determine_tomorrow(neighbour_array)
            maincell.alive_tomorrow?.should == false
        end
    end
end
true
