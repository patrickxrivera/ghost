require_relative 'game'
require_relative 'player'

print 'Player one name: '
player_one_name = gets.chomp

print 'Player two name: '
player_two_name = gets.chomp

player_one = Player.new(player_one_name)
player_two = Player.new(player_two_name)

players = [player_one, player_two]

game = Game.new(players)

until game.game_over?
    p '----------------'
    game.play_round
end

p game.congratulate