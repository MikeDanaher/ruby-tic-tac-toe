class Computer
  attr_reader :symbol, :first_moves

  def initialize(symbol)
    @symbol = symbol
    @first_moves = [0, 2, 4, 6, 8]
  end

  def get_move(board, opponent)
    return first_moves.sample if board.empty?
    initial_depth = 0
    get_best_move(board, initial_depth, symbol, opponent)
  end

  def get_best_move(board, depth, current_player, opponent, scores={})
    return -1 if board.get_winner
    return 0 if board.full?

    board.available_cells.each do |cell|
      board.make_move(cell, current_player)
      scores[cell] = -1 * get_best_move(board, depth - 1, opponent, current_player, {})
      board.remove(cell)
    end

    best_move = scores.max_by{ |cell, score| score }[0]
    highest_score = scores.max_by { |cell, score| score }[1]

    depth == 0 ? best_move : highest_score

  end

end
