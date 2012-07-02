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
        super(600, 600, false, 500) 
        self.caption = "RubyLife"
        @grid = the_grid
        @live_cell_image = Gosu::Image.new(self, "images/Cell50x50.png", false)
        @dead_cell_image = Gosu::Image.new(self, "images/Empty50x50.png", false)
        @font = Gosu::Font.new(self, Gosu::default_font_name, 18)

        @paused = true
    end

    def update
        if !@paused
            @grid.next_generation
        end
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
        
        @font.draw("Generation: #{@grid.generation} #{ if @paused then '(paused)' end}", 10, 550, 0, 1.0, 1.0, 0xffffff00)
        @font.draw("Space to pause, s to step (when paused) & Esc to quit", 10, 580, 0, 1.0, 1.0, 0xffffff00)
    end
    
    def button_down(id)
    if id == Gosu::KbEscape
      close
    end
    if button_down? Gosu::KbSpace then
        @paused = !@paused
    end
    if button_down? char_to_button_id('s') then
        @grid.next_generation
    end
    if button_down? char_to_button_id('q') then
        close
    end
  end
end


