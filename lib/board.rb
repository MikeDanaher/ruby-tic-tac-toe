class Board
  attr_reader :size, :state

  def initialize(size)
    @size = size
    @state = create_empty_state(size)
  end

  def get_state
    state
  end

  def make_move(cell, symbol)
    state[cell] = symbol
  end

  def winner?
    winner = false

    possible_wins = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6]
    ]

    possible_wins.each do |row|
      row.map! { |cell| state[cell] }
      if row.uniq.length == 1 && row.uniq != ['']
        winner = true
        break
      end
    end

    winner
  end

  def to_s
    rows = insert_vertical_seperators(get_horizontal_rows)
    output = insert_horizontal_seperators(rows)
    return " #{output} \n"
  end

  private

  def create_empty_state(size)
    Array.new(size) { ' ' }
  end

  def get_horizontal_rows
    state.each_slice(3).to_a
  end

  def insert_vertical_seperators(rows)
    rows.map! { |row| row.join(" | ") }
  end

  def insert_horizontal_seperators(rows)
    rows.join(" \n-----------\n ")
  end

end
