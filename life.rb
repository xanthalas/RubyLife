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
@grid.load_map("./maps/map1", 10, 10)

@window = LifeWindow.new(@grid)

@window.show

