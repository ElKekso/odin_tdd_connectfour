require_relative './player'

# Class for a Game of Connect Four
class ConnectFour
  attr_reader :board

  def initialize(player1, player2, board = get_new_board)
    @player1 = player1
    @player2 = player2
    @board = board
  end

  def player_move(player, column)
    column -= 1
    @board[column].each_with_index do |value, index|
      if value.zero?
        @board[column][index] = player
        break
      end
    end
  end

  def get_new_board
    Array.new(7) { Array.new(6, 0) }
  end
end
