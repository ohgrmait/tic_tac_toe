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
      puts row.join('  |  ').prepend('  ')
      next if index == @board.length - 1

      puts ' ----|-----|----'
    end
  end

  def update_board(choice, grid_no)
    grid_count = 0
    @board.each_with_index do |row, row_idx|
      row.each_with_index do |column, column_idx|
        grid_count += 1
        @board[row_idx][column_idx] = choice if grid_count == grid_no &&
                                                (column.instance_of? Integer)
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
    second_diagonal.all? { |elem| elem == 'X' } ||
      second_diagonal.all? { |elem| elem == 'O' }
  end

  def first_diagonal_match?
    first_diagonal = (0..@board.size - 1).collect do |index|
      @board[index][index]
    end
    first_diagonal.all? { |elem| elem == 'X' } ||
      first_diagonal.all? { |elem| elem == 'O' }
  end

  def diagonal_match?
    true if first_diagonal_match? || second_diagonal_match?
  end

  def vertical_match?
    @board.transpose.any? do |row|
      row.all? { |elem| elem == 'X' } || row.all? { |elem| elem == 'O' }
    end
  end

  def horizontal_match?
    @board.any? do |row|
      row.all? { |elem| elem == 'X' } || row.all? { |elem| elem == 'O' }
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
