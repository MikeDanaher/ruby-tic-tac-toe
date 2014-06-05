class Board
  attr_reader   :size, :winning_rows, :number_of_rows, :state

  def initialize(options)
    @size = options[:size]
    @winning_rows = options[:winning_rows]
    @number_of_rows = options[:number_of_rows]
    @state = create_empty_state(size)
  end

  def make_move(cell, symbol)
    state[cell] = symbol
  end

  def remove(cell)
    state[cell] = ' '
  end

  def available_cells
    state.map.with_index { |symbol, i| i if symbol == ' ' }.compact
  end

  def get_winner
    winner = nil
    winning_rows.each do |row|
      values = row.map { |cell| state[cell] }
      if values.uniq.length == 1 && values.uniq != [' ']
        winner = values[0]
        break
      end
    end
    winner
  end

  def full?
    available_cells.size == 0
  end

  def to_s
    rows = insert_vertical_seperators(get_horizontal_rows)
    output = insert_horizontal_seperators(rows)
    return "\n #{output} \n\n"
  end

  private

  def create_empty_state(size)
    Array.new(size) { ' ' }
  end

  def get_horizontal_rows
    state.each_slice(number_of_rows).to_a
  end

  def insert_vertical_seperators(rows)
    rows.map! { |row| row.join(" | ") }
  end

  def insert_horizontal_seperators(rows)
    rows.join(" \n-----------\n ")
  end

end
