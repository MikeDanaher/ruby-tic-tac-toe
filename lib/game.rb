require './lib/board'
require './lib/output'

class Game
  attr_reader :board

  def initialize(options)
    @board = Board.new(options)
  end

  def play(current_player, opponent)
    print_board
    cell_choice = current_player.get_move(board, opponent.symbol)
    board.make_move(cell_choice, current_player.symbol)

    if board.get_winner
      end_game("Player #{current_player.symbol} wins!")
    elsif board.full?
      end_game("It's a tie!")
    else
      play(opponent, current_player)
    end
  end

  def end_game(message)
    print_board
    Output.put_string(message)
  end

  def print_board
    Output.put_string(board.to_s)
  end

end

