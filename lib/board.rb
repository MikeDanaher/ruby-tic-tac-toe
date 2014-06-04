class Board
  attr_reader   :size, :winning_rows, :number_of_rows, :state
  attr_accessor :winner

  def initialize(options)
    @size = options[:size]
    @winning_rows = options[:winning_rows]
    @number_of_rows = options[:number_of_rows]
    @winner = false
    @state = create_empty_state(size)
  end

  def make_move(cell, symbol)
    state[cell] = symbol
  end

  def available_cells
    state.map.with_index { |symbol, i| i if symbol == ' ' }.compact
  end

  def winner?
    winning_rows.each do |row|
      values = row.map { |cell| state[cell.to_i] }
      if values.uniq.length == 1 && values.uniq != [' ']
        self.winner = true
        break
      end
    end
    self.winner
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
