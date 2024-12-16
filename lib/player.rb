class Player
  def initialize
    @choice = %w[X O].sample
  end

  def turn
    @choice = if @choice == 'X'
                'O'
              else
                'X'
              end
  end
end
