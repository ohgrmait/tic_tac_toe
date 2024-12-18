# frozen_string_literal: true

class Game # rubocop:disable Style/Documentation
  def initialize
    @board = [
      [1, 2, 3],
      [4, 5, 6],
      [7, 8, 9]
    ]
  end

  def display_board
    @board.each_with_index do |row, index|
      puts row.join('  |  ').prepend("\t\t ")
      next if index == @board.length - 1

      puts "\t\t----|-----|----"
    end
  end

  def update_board(choice, grid_no) # rubocop:disable Metrics/MethodLength
    grid_count = 0
    @board.each_with_index do |row, row_idx|
      row.each_with_index do |column, column_idx|
        grid_count += 1
        next unless grid_count == grid_no && (column.instance_of? Integer)

        @board[row_idx][column_idx] =
          if choice == 'X'
            choice.colorize(color: :light_red, mode: :bold)
          else
            choice.colorize(color: :light_yellow, mode: :bold)
          end
      end
    end
  end

  def over?
    true if drawn? || won?
  end

  def drawn?
    @board.flatten.count { |elem| elem.instance_of? Integer }.zero?
  end

  def won?
    true if horizontal_match? || vertical_match? ||
            diagonal_match?
  end

  def horizontal_match?
    @board.any? do |row|
      row.all? do |elem|
        elem == 'X'.colorize(color: :light_red,
                             mode: :bold)
      end ||
        row.all? do |elem|
          elem == 'O'.colorize(color: :light_yellow,
                               mode: :bold)
        end
    end
  end

  def vertical_match?
    @board.transpose.any? do |row|
      row.all? do |elem|
        elem == 'X'.colorize(color: :light_red,
                             mode: :bold)
      end ||
        row.all? do |elem|
          elem == 'O'.colorize(color: :light_yellow,
                               mode: :bold)
        end
    end
  end

  def diagonal_match?
    true if first_diagonal_match? || second_diagonal_match?
  end

  def first_diagonal_match? # rubocop:disable Metrics/MethodLength
    first_diagonal = (0..@board.size - 1).collect do |index|
      @board[index][index]
    end
    first_diagonal.all? do |elem|
      elem == 'X'.colorize(color: :light_red,
                           mode: :bold)
    end ||
      first_diagonal.all? do |elem|
        elem == 'O'.colorize(color: :light_yellow,
                             mode: :bold)
      end
  end

  def second_diagonal_match? # rubocop:disable Metrics/MethodLength
    second_diagonal = (0..@board.size - 1).collect do |index|
      @board[index][-index - 1]
    end
    second_diagonal.all? do |elem|
      elem == 'X'.colorize(color: :light_red,
                           mode: :bold)
    end ||
      second_diagonal.all? do |elem|
        elem == 'O'.colorize(color: :light_yellow,
                             mode: :bold)
      end
  end
end
