# This is the main entrypoint into the program
# It requires the other files/gems that it needs
require 'pp'
require './player'
require './game'

## Your test code can go here

# pp @candidates
# pp qualified_candidates(@candidates)

game = Game.new 
game.start