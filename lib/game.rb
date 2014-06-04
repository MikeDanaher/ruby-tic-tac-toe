require './lib/board'
require './lib/game_config'
require './lib/human'
require './lib/input'
require './lib/output'

class Game
  attr_accessor :move_count
  attr_reader   :player1, :player2, :board

  def initialize(symbol1, symbol2)
    @player1    = Human.new(symbol1)
    @player2    = Human.new(symbol2)
    @board      = Board.new(GameConfig.options_3x3)
    @move_count = 0
  end

  def game_loop(current_player, opponent)
    Output.put_string(board.to_s)

    cell_choice = current_player.get_move(board.available_cells)
    board.make_move(cell_choice, current_player.symbol)
    self.move_count += 1

    if board.winner?
      end_game(current_player.symbol)
    elsif self.move_count == board.size
      tie_game
    else
      game_loop(opponent, current_player)
    end
  end

  def end_game(current_player)
    Output.put_string(board.to_s)
    Output.put_string("Player #{current_player} wins!")
  end

  def tie_game
    Output.put_string(board.to_s)
    Output.put_string("It's a tie!")
  end

end

