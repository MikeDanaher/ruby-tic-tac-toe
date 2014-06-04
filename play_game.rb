require './lib/game'
require './lib/game_config'
require './lib/human'
require './lib/computer'

puts "Ready to play Tic-Tac-Toe against the Computer?"
print "Choose your symbol: "
human_symbol = gets.chomp
print "Choose your opponent's symbol: "
cpu_symbol = gets.chomp
print "Would you like to go first? (y/n): "
first_player = gets.chomp

human_player = Human.new(human_symbol)
cpu_player = Computer.new(cpu_symbol)
new_game = Game.new(GameConfig.options_3x3)

if first_player.downcase == 'y'
  new_game.play(human_player, cpu_player)
else
  new_game.play(cpu_player, human_player)
end

