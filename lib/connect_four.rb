require_relative './player.rb'

class ConnectFour
  def initialize(player1, player2, board = get_new_board)
    @player1 = player1
    @player2 = player2
    @board = board
  end

  def player_move(player, column)
    board[column].each_with_index do |value, index|
      if value == 0
        board[column][index] = player
        
      end
    end
  end

  def get_new_board
    Array.new(7) { Array.new(6,0) }
  end
end