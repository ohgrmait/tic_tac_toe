require 'colorize'

require_relative 'lib/game'
require_relative 'lib/player'

game = Game.new
player = Player.new

puts '...A game of Tic Tac Toe between two players...'
puts ''
puts '...Player X (PX) and O (PO) can alternate and..'
puts '...mark the grids from 1 to 9 to play the game.'
puts ''
game.display_board
puts ''

until game.over?
  turn = player.turn

  print "...[P#{turn}] Grid? "
  grid_no = gets.chomp.to_i

  game.update_board(turn, grid_no)
  game.display_board
end

puts ''

if game.won?
  if turn == 'X'
    puts "...Congratulations! Player #{turn} has won the game...".colorize(color: :light_red, mode: :bold)
  elsif turn == 'O'
    puts "...Congratulations! Player #{turn} has won the game...".colorize(color: :light_yellow, mode: :bold)
  end
elsif game.drawn?
  puts '...What a bummer! Both players have drawn the game...'.colorize(color: :light_green, mode: :bold)
  puts '...Wow! Get back to grade school you two! Pathetic...'.colorize(color: :light_green, mode: :bold)
end
