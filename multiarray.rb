##########################################################################################
# Program: rubylife                                                                      #
# Author : Xanthalas                                                                     #
# Class  : MultiArray                                                                    #
#        : All the code to store and manipulate the grid of cells                        #
##########################################################################################

require './cell'

class Multiarray

  def initialize(columns, rows)
    @columns = Array.new
    columns.times {
        @columns << Array.new(rows)
    }
  end

  def column_count
      @columns.count
  end

  def row_count
    @columns[0].count
  end

  #Iterates through the multiarray a column at a time
  def each
      for i in 0...column_count
          for j in 0...row_count
              value = self[i][j]
              yield(value)
          end
      end
  end

  def populate
      @columns.count.times {|colIndex| 
          thisRow = @columns[colIndex]
          thisRow.count.times {|rowIndex|
            if block_given?
                newCell = yield
                thisRow[rowIndex] = newCell
            end
          }
      }
  end

  def get_cell(column, row)
      if column <= column_count && row <= row_count
          return @columns[column][row]
      end
  end

  def [](index)
      return @columns[index]
  end

  def set_cell(column, row, value)
      if column <= column_count && row <= row_count
          @columns[column][row] = value
      end
  end
end
