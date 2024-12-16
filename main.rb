require_relative 'lib/game'
require_relative 'lib/player'

game = Game.new
player = Player.new

game.display_board
game.update_board(player.turn, 5)
puts ''
game.display_board
game.update_board(player.turn, 3)
puts ''
game.display_board
game.update_board(player.turn, 8)
puts ''
game.display_board
game.update_board(player.turn, 1)
puts ''
game.display_board
