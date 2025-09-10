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
    won = who_won_vertically
    return won if !won.nil?
    won = who_won_horizontally
    return won if !won.nil?
  end

  def who_won_vertically(board = @board)
    # count amount of times the same player was found in a row
    count = 1
    # the prior field
    prior = nil

    board.each do |column|
      break if count == 4

      #reset prior for next column
      prior = nil
      column.each do |row|
        break if row == 0 || count == 4

        # add one to count if value is same as prior or reset to 1
        if prior == row
          count += 1
        else
          count = 1
        end
        prior = row
      end
    end
    prior
  end

  def who_won_horizontally
     # count amount of times the same player was found in a row
    count = 1
    # the prior field
    prior = nil

    # loop through the rows
    (0..5).each do |row|
      break if count == 4

      #reset prior for next row
      prior = nil
      (0..6).each do |column|
        board_value = @board[column][row]
        break if board_value == 0 || count == 4

        # add one to count if value is same as prior or reset to 1
        if prior == board_value
          count += 1 
        else
          count = 1
        end
        prior = board_value
      end
    end
    prior
  end

  def who_won_diagonally
    
  end
end
