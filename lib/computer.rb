class Computer
  attr_reader :symbol

  def initialize(symbol)
    @symbol = symbol
  end

  def get_move(available_cells)
    available_cells.sample
  end

end
