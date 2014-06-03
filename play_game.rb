require './lib/game'

new_game = Game.new('x', 'o')

new_game.game_loop(new_game.player1, new_game.player2)
