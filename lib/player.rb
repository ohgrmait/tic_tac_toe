# frozen_string_literal: true

class Player # rubocop:disable Style/Documentation
  attr_reader :choice

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
