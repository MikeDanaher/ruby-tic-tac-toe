require './lib/output'
require './lib/input'

class Human
  attr_reader :symbol, :prompt_message, :error_message

  def initialize(symbol)
    @symbol         = symbol
    @prompt_message = "Player #{symbol}, please select a valid cell: "
    @error_message  = "Invalid, please try again: "
  end

  def get_move(available_cells, message = prompt_message)
    Output.print_string(message)
    choice = Input.get_number

    available_cells.include?(choice) ? choice : get_move(available_cells, error_message)
  end

end

