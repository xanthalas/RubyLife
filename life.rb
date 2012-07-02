#! /usr/bin/ruby
##########################################################################################
# Program: life                                                                          #
# Author : Xanthalas                                                                     #
#        : This is a version of Conway's Game of Life written in Ruby.                   #
##########################################################################################
require 'rubygems'
require 'gosu'
require './lifewindow'
require './grid'

@grid = Grid.new(10, 10)
if (ARGV.count > 0) then
    puts ARGV[0]
    @grid.load_map(ARGV[0], 10, 10)
else
    @grid.load_map("./maps/map1", 10, 10)
end

@window = LifeWindow.new(@grid)

@window.show

