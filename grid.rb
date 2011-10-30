##########################################################################################
# Program: rubylife                                                                      #
# Author : Xanthalas                                                                     #
# Class  : Grid                                                                          #
# File   : grid.rb                                                                       #
#        : All the code to store and manipulate the grid of cells                        #
##########################################################################################

require './cell'

class Grid
  attr_reader :columns, :rows

  def initialize(columns, rows)
    @columns = Array.new(columns, rows)

    columns.times { @columns << Cell.new(false) }
  end
end
