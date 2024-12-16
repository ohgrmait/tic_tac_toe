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
end
