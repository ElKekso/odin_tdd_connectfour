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

  def start_game()

  def get_new_board
    Array.new(7) { Array.new(6, 0) }
  end

  def who_won
    [who_won_vertically, who_won_horizontally, who_won_diagonally].find { |item| !item.nil? }
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
    # calculate if someone won on diagonals going up right
    won = calc_diagonals()
    return won if !won.nil?
    # clone and flip board to calculate if someone won on diagonals going down right
    cloned_board = @board.map { |array| array.map(&:clone) }
    flipped_board = cloned_board.map { |array| array.reverse }
    won = calc_diagonals(flipped_board)
    won
  end

  def calc_diagonal_column(x=0,y=0,board)
    # count amount of times the same player was found in a row
    count = 1
    # found value from prior iteration
    prior = nil
    # min length between column and row length
    min_length = [board.length(),board[0].length].min
    (0..min_length).each do |i|
      # column and row getting their offset added
      column = i + x
      row = i + y
      # check for row and column to not be out of bounds or if someone won
      break if column > 6 || row > 5 || count == 4
      board_value = board[column][row]
      if board_value == prior
        count += 1
      else
        count = 1
      end
      prior = board_value
    end
    prior if count == 4
  end

  def calc_diagonals(board=@board)
    # subtract 4 because len() is one higher than highest index (1) and last 3 spots cant be diagonal in tested direction
    row_length_subtracted = board.length() - 4
    column_length_subtracted = board[0].length() - 4

    # calculate result starting from [0][0] and increasing offset to column
    (0..row_length_subtracted).each do |i|
      diagonal_result = calc_diagonal_column(x=i,board=board)
      return diagonal_result if !diagonal_result.nil?
    end

    # start at 1 because [0][0] upwards cascade already tried
    (1..column_length_subtracted).each do |i|
      diagonal_result = calc_diagonal_column(y=i, board=board)
      return diagonal_result if !diagonal_result.nil?
    end
    nil
  end

  def print_board
    board = ""
    (0..5).each do |i|
      string_row = ""
      (0..6).each do |j|
        board_value = @board[j][i]
        mark = " "
        if board_value == @player1
          mark = "x"
        elsif board_value == @player2
          mark = "o"
        end
        string_row += " | " + mark
      end
      string_row += " | "
      board += string_row
    end
    print(board)
  end
