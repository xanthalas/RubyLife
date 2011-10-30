##########################################################################################
# Program: rubylife                                                                      #
# Author : Xanthalas                                                                     #
# Class  : Cell                                                                          #
# File   : cell.rb                                                                       #
#        : An individual cell.                                                           #
##########################################################################################

class Cell

  attr_accessor :alive

  attr_reader :alive_tomorrow, :iteration_last_updated
  
  def initialize(is_alive)

    @alive = is_alive
    @alive_tomorrow = @alive
    @iteration_last_updated = 0
  end

  def alive?
    return @alive
  end

  def alive_tomorrow?
      return @alive_tomorrow
  end

  # Determine the fate of this cell
  def determine_tomorrow(neighbour_array)
    if self.alive? 
        determine_if_cell_survives(neighbour_array)
    else
        determine_if_cell_is_born(neighbour_array)
    end

    @iteration_last_updated += 1
  end

  # This cell is currently alive. See if it survives
  def determine_if_cell_survives(neighbour_array)
      live_neighbour_count = get_live_neighbour_count(neighbour_array)

      if live_neighbour_count < 2
        @alive_tomorrow = false 
      elsif live_neighbour_count > 3
        @alive_tomorrow = false
      else
        @alive_tomorrow = true
      end
  end

  # This cell is currently dead. See if it springs to life
  def determine_if_cell_is_born(neighbour_array)
      live_neighbour_count = get_live_neighbour_count(neighbour_array)

      if live_neighbour_count == 3
          @alive_tomorrow = true
      else
          @alive_tomorrow = false
      end
  end

  # Determines the number of live neighbours which this cell has
  def get_live_neighbour_count(neighbour_array)
      live_neighbour_count = 0

      if !neighbour_array.nil?
          neighbour_array.each {|neighbour| 
              live_neighbour_count += 1 if (!neighbour.nil?) && neighbour.alive? 
          }
      end
      return live_neighbour_count
  end
end

