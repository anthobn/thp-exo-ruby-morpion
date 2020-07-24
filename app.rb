require 'bundler'
Bundler.require

#Load path variable to require files in lib folder
$:.unshift File.expand_path("./../lib", __FILE__)
require 'application'
require 'board'
require 'board_case'
require 'game'
require 'player'
require 'show'

Application.game
