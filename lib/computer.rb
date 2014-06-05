class Computer
  attr_reader   :symbol, :initial_depth
  attr_accessor :base_score

  def initialize(symbol)
    @symbol        = symbol
    @base_score    = 0
    @initial_depth = 0
  end

  def get_move(board, opponent)
    self.base_score = board.available_cells.size + 1
    bound = base_score + 1
    get_best_move(board, initial_depth, -bound, bound, symbol, opponent)
  end

  def get_best_move(board, depth, lower_bound, upper_bound, current_player, opponent)
    return final_score(board, depth) if board.get_winner || board.full?
    best_move = 0

    board.available_cells.each do |cell|
      board.make_move(cell, current_player)
      score = get_best_move(board, depth + 1, lower_bound, upper_bound, opponent, current_player)
      board.remove(cell)

      if current_player == symbol
        if score > lower_bound
          lower_bound = score
          best_move = cell
        end
      else
        upper_bound = [score, upper_bound].min
      end

      break if upper_bound < lower_bound

    end

    if depth == 0
      best_move
    else
      current_player == symbol ? lower_bound : upper_bound
    end

  end

  def final_score(board, depth)
    winner = board.get_winner

    if winner == symbol
      self.base_score - depth
    elsif winner
      depth - self.base_score
    else
      0
    end
  end
end
