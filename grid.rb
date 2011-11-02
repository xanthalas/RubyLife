##########################################################################################
# Program: rubylife                                                                      #
# Author : Xanthalas                                                                     #
# Class  : Grid                                                                          #
# File   : grid.rb                                                                       #
#        : All the code to store and manipulate the grid of cells                        #
##########################################################################################

require './cell'

class Grid
  attr_reader :area, :generation

  def initialize(columns, rows)
    @area = Multiarray.new(columns, rows)

    @area.populate { Cell.new(false) }

    @generation = 0
  end

  def next_generation
    for row in 0...@area.row_count
        for column in 0...@area.column_count
#            puts "Row=#{row} Col=#{column}" 
        end
    end
  end

  def get_neighbours(column, row)
      row_above = row - 1
      row_below = row + 1

      column_left = column - 1
      column_right = column + 1

      neighbour_array = Array.new

      neighbour_array << get_cell_or_nil(column_left, row_above)
      neighbour_array << get_cell_or_nil(column, row_above)
      neighbour_array << get_cell_or_nil(column_right, row_above)
      
      neighbour_array << get_cell_or_nil(column_left, row)
      neighbour_array << get_cell_or_nil(column_right, row)

      neighbour_array << get_cell_or_nil(column_left, row_below)
      neighbour_array << get_cell_or_nil(column, row_below)
      neighbour_array << get_cell_or_nil(column_right, row_below)

      return neighbour_array
  end

  def get_cell_or_nil(column, row)

      if column < 0 || row < 0
          value = nil
      elsif column >= @area.column_count || row >= @area.row_count
          value = nil
      else
          value = @area[row][column]
      end

      return value
  end
end
