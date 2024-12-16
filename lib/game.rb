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
      puts row.join('  |  ').prepend(' ')
      next if index == @board.length - 1

      puts '----|-----|----'
    end
  end
end
