class Board
  attr_reader   :size, :winning_rows, :number_of_rows, :state

  def initialize(options)
    @size = options[:size]
    @winning_rows = options[:winning_rows]
    @number_of_rows = options[:number_of_rows]
    @state = Array.new(size)
  end

  def make_move(cell, symbol)
    state[cell] = symbol
  end

  def remove(cell)
    state[cell] = nil
  end

  def available_cells
    state.map.with_index{ |symbol, index| index if !symbol }.compact
  end

  def full?
    available_cells.size == 0
  end

  def empty?
    available_cells.size == size
  end

  def get_winner
    winner = nil
    winning_rows.each do |row|
      values = row.map { |cell| state[cell] }
      if values.uniq.length == 1 && values.uniq
        winner = values[0]
        break
      end
    end
    winner
  end

  def to_s
    new_state = insert_spaces_in_state
    rows = insert_vertical_seperators(get_horizontal_rows(new_state))
    output = insert_horizontal_seperators(rows)
    "\n #{output} \n\n"
  end

  private

  def insert_spaces_in_state
    state.map { |symbol| symbol ? symbol : ' ' }
  end

  def get_horizontal_rows(new_state)
    new_state.each_slice(number_of_rows).to_a
  end

  def insert_vertical_seperators(rows)
    rows.map! { |row| row.join(" | ") }
  end

  def insert_horizontal_seperators(rows)
    rows.join(" \n-----------\n ")
  end

end
