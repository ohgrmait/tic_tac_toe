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

  def get_input(turn) # rubocop:disable Metrics/MethodLength
    print "...[P#{turn}] Grid? "
    grid_no = gets.chomp
    raise StandardError if (grid_no.chars.size > 1) ||
                           (grid_no.to_i < 1 || grid_no.to_i > 9)
  rescue StandardError
    puts ''
    puts '!!![You can only enter values between 1 and 9]'
      .colorize(color: :light_red, mode: :bold, background: :light_yellow)
    puts ''
    retry
  else
    grid_no.to_i
  end

  def play_game
    until @game.over?
      turn = @player.turn
      grid_no = get_input(turn)
      @game.update_board(turn, grid_no)
      @game.display_board
      puts ''
    end
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
