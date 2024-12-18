# frozen_string_literal: true

require_relative 'game'
require_relative 'player'

class TicTacToe # rubocop:disable Style/Documentation
  def initialize
    @game = Game.new
    @player = Player.new
  end

  def start_game
    show_prompt
    play_game
    end_game
  end

  def show_prompt
    puts '...A game of Tic Tac Toe between two players...'
    puts ''
    puts '...Player X (PX) and O (PO) can alternate and..'
    puts '...mark the grids from 1 to 9 to play the game.'
    puts ''
    @game.display_board
    puts ''
  end

  def play_game
    until @game.over?
      turn = @player.turn
      print "...[P#{turn}] Grid? "
      grid_no = gets.chomp.to_i
      @game.update_board(turn, grid_no)
      @game.display_board
    end
    puts ''
  end

  def end_game # rubocop:disable Metrics/MethodLength
    if @game.drawn?
      puts '...What a bummer! Both players have drawn the game...'
        .colorize(color: :light_green, mode: :bold)
      puts '...Wow! Get back to grade school you two! Pathetic...'
        .colorize(color: :light_green, mode: :bold)
    elsif @game.won? && @player.choice == 'X'
      puts "...Congratulations! Player #{@player.choice} has won the game..."
        .colorize(color: :light_red, mode: :bold)
    elsif @game.won? && @player.choice == 'O'
      puts "...Congratulations! Player #{@player.choice} has won the game..."
        .colorize(color: :light_yellow, mode: :bold)
    end
  end
end
