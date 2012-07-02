#! /usr/bin/ruby
##########################################################################################
# Program: Rubylife                                                                      #
# Author : Xanthalas                                                                     #
# Class  : Grid                                                                          #
# File   : lifewindow.rb                                                                 #
#        : This is the main window code for the program. It handles drawing the screen.  #
##########################################################################################
require 'rubygems'
require 'gosu'

class LifeWindow < Gosu::Window

    attr_accessor :grid

    def initialize(the_grid)
        super(600, 600, false, 1000) 
        self.caption = "RubyLife"
        @grid = the_grid
        @live_cell_image = Gosu::Image.new(self, "images/Cell50x50.png", false)
        @dead_cell_image = Gosu::Image.new(self, "images/Empty50x50.png", false)
        @font = Gosu::Font.new(self, Gosu::default_font_name, 20)
    end

    def update
        @grid.next_generation
    end

    def draw
        top = 0
        for row in 0...@grid.area.row_count
            left = 0
            for column in 0...@grid.area.column_count
                cell = @grid.area[column][row]
                if cell.alive?
                    @live_cell_image.draw(left, top, 0)
                else
                    @dead_cell_image.draw(left, top, 0)
                end

                left = left + 50
            end
            top = top + 50
        end
        
        @font.draw("Generation: #{@grid.generation}", 10, 550, 0, 1.0, 1.0, 0xffffff00)
    end
end


