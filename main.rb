require_relative 'lib/game'
require_relative 'lib/player'

game = Game.new
player = Player.new

until game.over?
  turn = player.turn

  print "~ Player #{turn} => "
  grid_no = gets.chomp.to_i

  puts ''

  game.update_board(turn, grid_no)
  game.display_board

  puts ''
end
