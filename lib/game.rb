require './lib/board'
require './lib/human'
require './lib/input'
require './lib/output'

class Game
  attr_reader :player1, :player2, :board

  def initialize(symbol1, symbol2)
    @player1    = Human.new(symbol1)
    @player2    = Human.new(symbol2)
    @board      = Board.new(9)
    @move_count = 0
  end

  def game_loop(current_player, opponent)
    Output.put_string(board.to_s)
    Output.print_string("Player #{current_player.symbol}, please choose a cell: ")

    cell_choice = Input.get
    board.make_move(cell_choice, current_player.symbol)
    @move_count += 1

    if board.winner?
      end_game(current_player.symbol)
    elsif @move_count == board.size
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

