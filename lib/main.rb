require_relative './connect_four.rb'
require_relative './player.rb'

def get_player_name(player)
    match_pattern = /^\w+$/
    name = ""
    loop do
    puts("Please insert name of " + player)
    name = gets.chomp.strip
    break if match(match_pattern, name)
    end
    name
end

def get_play(current_player)
    match_pattern = /[1-7]/
    column = ""
    loop do
        puts "Which column does " + current_player.name + " want to put a chip in?"
        column = gets.chomp.strip
        break if match(match_pattern, column)
    end
    column
end

def match(match_pattern, input)
    match_pattern.match(input)
end

def play(game,current_player)
    loop do
        played_column = get_play(current_player).to_i
        break if game.player_move(current_player,played_column)
        puts "Column was already full. Please try again. \n"
    end
end

def next_player(current_player, player1, player2)
    if current_player == player1
        player2
    else
        player1
    end
end

def win_message(winner, player1, player2)
    if winner == player1
       puts player_win_message(player1)
    elsif winner == player2
        puts player_win_message(player2)
    else
         puts "Its a draw womp womp"
    end
end

def player_win_message(player)
    player.name + " won!!!"
end

# get player name 1 & 2
# create player 1 & 2
# create game
# print out board
# open loop
# where does player_name want to place
# check if legal
# show board
# winner = whowon?
# break if winner != 0 || board_full
# update current_player
# end loop
# if winner == 0
# draw message
# else
# winner won message

player1 = Player.new(get_player_name("first player"))
player2 = Player.new(get_player_name("second player"))

game = ConnectFour.new(player1, player2)

game.print_board
current_player = player1
winner = 0

loop do
    play(game, current_player)
    game.print_board
    winner = game.who_won
    break if winner != 0 || game.full?
    current_player = next_player(current_player, player1, player2)
end

win_message(winner, player1, player2)

