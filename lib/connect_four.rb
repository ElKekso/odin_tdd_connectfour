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

  def who_won
    count = 1
    prior = nil
    @board.each do |column|
      break if count == 4

      prior = nil
      column.each do |row|
        break if row == 0 || count == 4

        if prior == row
          count += 1
        else
          count = 1
        end
        prior = row
      end
    end
    prior if count == 4
  end
end
