require_relative '../lib/connect_four.rb'
require_relative '../lib/player.rb'

describe ConnectFour do

  let(:player1) { Player.new('Aaron') }
  let(:player2) { Player.new('Marlene') }

    #Looping Script Method
    describe '#start_game' do
        
    end

    describe '#player_move' do
        subject(:game_move) { described_class.new }
        it 'changes the board' do
            expect { game.player_move(player1,2) }.to change { game.instance_variable_get(:board)[1][0] }.to(player1)
        end
    end

    describe '#get_new_board' do
    
    end
end
