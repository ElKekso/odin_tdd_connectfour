require_relative '../lib/connect_four'
require_relative '../lib/player'

require_relative './helper'

RSpec.configure do |c|
  c.include Helpers
end

describe ConnectFour do
  let(:player1) { Player.new('Aaron') }
  let(:player2) { Player.new('Marlene') }
  subject(:game) { described_class.new(player1, player2) }

  # Looping Script Method
  describe '#start_game' do
  end

  describe '#get_new_board' do
  end

  describe '#player_move' do
    subject(:game_move) { described_class.new(player1, player2) }
    let(:board_move) { create_cf_board }

    before do
      board_move[1][0] = player1
    end
    it 'changes the right position in the column' do
      expect { game_move.player_move(player1, 2) }.to change { game_move.instance_variable_get(:@board) }.to (board_move)
    end

    context 'when column number 3 is full returns false' do
      let(:board_move_full) do
        board_move_full = create_cf_board
        column_length = board_move_full[0].length
        board_move_full[2] = Array.new(column_length, player1)
        board_move_full
      end
      subject(:game_move_full) { described_class.new(player1, player2, board_move_full) }

      it 'changes nothing' do
        expect { game_move_full.player_move(player1, 3) }.not_to change { game_move.instance_variable_get(:@board) } 
      end

      it 'returns false' do
        expect(game_move_full.player_move(player1, 3)).to be(false)
      end
    end
  end

  describe '#who_won' do

    context 'when player1 won vertically' do
      # create a board that wins vertically in the first column
      let(:board_vertically) do
        board_vertically = create_cf_board
        (0..3).each do |i|
          board_vertically[0][i] = player1
        end
        board_vertically
      end

      subject(:game_vertically) { described_class.new(player1, player2, board_vertically) }
      it 'returns player1' do
        expect(game_vertically.who_won).to be(player1)
      end
    end

    context 'when player2 won horizontally' do
      # create a board that wins horizontally in the first row
      let(:board_horizontally) do
        board_horizontally = create_cf_board
        (0..3).each do |i|
          board_horizontally[i][0] = player2
        end
        board_horizontally
      end

      subject(:game_horizontally) { described_class.new(player1, player2, board_horizontally) }

      it 'returns player2' do
        expect(game_horizontally.who_won).to be(player2)
      end
    end

    context 'when player1 won diagonally up from [0][0]' do
      # create a board that wins diagonally
      let(:board_diagonally) do
        board_diagonally = create_cf_board
        (0..3).each do |i|
          board_diagonally[i][i] = player1
        end
        board_diagonally
      end

      subject(:game_diagonally) { described_class.new(player1, player2, board_diagonally) }

      it 'returns player1' do
        expect(game_diagonally.who_won).to be(player1)
      end
    end

    context 'when player2 won diagonally down from [0][5]' do
    # create a board that wins diagonally
      let(:board_diagonally_down) do
        board_diagonally_down = create_cf_board
        (0..3).each do |i|
          board_diagonally_down[i][5 - i] = player2
        end
        board_diagonally_down
      end

      subject(:game_diagonally_down) { described_class.new(player1, player2, board_diagonally_down) }

      it 'returns player2' do
        expect(game_diagonally_down.who_won).to be(player2)
      end
    end
  end
end
