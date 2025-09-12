require_relative './connect_four.rb'
require_relative './player.rb'

def get_player_name
    match_pattern = /\W/
    name = ""
    loop do
    puts("Please insert your name")
    name = gets.chomp.strip
    break if !(match_pattern.match(name) || name.empty?)
    end
    name
end

