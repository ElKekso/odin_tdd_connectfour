require_relative '../lib/connect_four'
require_relative '../lib/player'

describe ConnectFour do
  let(:player1) { Player.new('Aaron') }
  let(:player2) { Player.new('Marlene') }

  # Looping Script Method
  describe '#start_game' do
  end

  describe '#get_new_board' do
  end

  describe '#player_move' do
    subject(:game_move) { described_class.new(player1, player2) }
    let(:board_move) { game_move.get_new_board }

    before do
      game_move.player_move(player1, 2)
      board_move[1][0] = player1
    end
    it 'changes the right position in the column' do
      expect(game_move.instance_variable_get(:@board)).to eql(board_move)
    end
  end

  describe '#who_won?' do
    subject(:game_win) { described_class.new(player1, player2) }
    let(:board_win) { game_move.get_new_board }

    context 'when player1 won horizontally' do
      before do
        (0..3).each do |i|
          board_win[0][i] = player1
        end
      end
      it 'returns player1' do
        expect { game_win.who_won? }.to be(player1)
      end
    end
  end
end
