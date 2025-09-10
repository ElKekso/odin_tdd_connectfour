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
      game_move.player_move(player1, 2)
      board_move[1][0] = player1
    end
    it 'changes the right position in the column' do
      expect(game_move.instance_variable_get(:@board)).to eql(board_move)
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

    context 'when player1 won diagonally' do
      # create a board that wins diagonally
      let(:board_diagonally) do
        board_diganoally = create_cf_board
        (0..3).each do |i|
          (0..3).each do |j|
            board_diagonally[i][j] = player1
          end
        end
        board_diagonally
      end

      subject(:game_diagonally) { described_class.new(player1, player2, board_diagonally) }

      xit 'returns player1' do
        expect(game_diagonally.who_won).to be(player1)
      end
    end
  end
end
