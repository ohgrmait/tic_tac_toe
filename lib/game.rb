class Game
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

  def update_board(choice, grid_no)
    grid_count = 0
    @board.each_with_index do |row, row_idx|
      row.each_with_index do |column, column_idx|
        grid_count += 1
        if grid_count == grid_no && (column.instance_of? Integer)
          if choice == 'X'
            @board[row_idx][column_idx] = choice.colorize(color: :light_red, mode: :bold)
          elsif choice == 'O'
            @board[row_idx][column_idx] = choice.colorize(color: :light_yellow, mode: :bold)
          end
        end
      end
    end
  end

  def drawn?
    @board.flatten.count { |elem| elem.instance_of? Integer }.zero?
  end

  def second_diagonal_match?
    second_diagonal = (0..@board.size - 1).collect do |index|
      @board[index][-index - 1]
    end
    second_diagonal.all? { |elem| elem == 'X'.colorize(color: :light_red, mode: :bold) } ||
      second_diagonal.all? { |elem| elem == 'O'.colorize(color: :light_yellow, mode: :bold) }
  end

  def first_diagonal_match?
    first_diagonal = (0..@board.size - 1).collect do |index|
      @board[index][index]
    end
    first_diagonal.all? { |elem| elem == 'X'.colorize(color: :light_red, mode: :bold) } ||
      first_diagonal.all? { |elem| elem == 'O'.colorize(color: :light_yellow, mode: :bold) }
  end

  def diagonal_match?
    true if first_diagonal_match? || second_diagonal_match?
  end

  def vertical_match?
    @board.transpose.any? do |row|
      row.all? { |elem| elem == 'X'.colorize(color: :light_red, mode: :bold) } ||
        row.all? { |elem| elem == 'O'.colorize(color: :light_yellow, mode: :bold) }
    end
  end

  def horizontal_match?
    @board.any? do |row|
      row.all? { |elem| elem == 'X'.colorize(color: :light_red, mode: :bold) } ||
        row.all? { |elem| elem == 'O'.colorize(color: :light_yellow, mode: :bold) }
    end
  end

  def won?
    true if horizontal_match? || vertical_match? ||
            diagonal_match?
  end

  def over?
    true if won? || drawn?
  end
end
