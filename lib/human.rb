require './lib/output'
require './lib/input'

class Human
  attr_reader :symbol

  def initialize(symbol)
    @symbol = symbol
  end

  def get_move(available_moves, input_method = Input, output_method = Output)
    output_method.print_string("Please select a valid cell")
    choice = input_method.gets

    if available_moves.include?(choice)
      choice
    else
      output_method.print_string("Cell not available, please select another")
    end
  end

end

