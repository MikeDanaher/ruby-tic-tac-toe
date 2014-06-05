require './lib/board'
require './lib/game_config'

describe Board do
  let(:board) { Board.new(GameConfig.options_3x3) }

  def build_board(board, moves, symbol)
    moves.each { |move| board.make_move(move, symbol) }
  end

  it 'creates a new board with a size of 9' do
    expect(board.size).to eq(9)
  end

  it 'gets the state of the current board as an array' do
    expect(board.state).to eq([' ',' ',' ',' ',' ',' ',' ',' ',' '])
  end

  it 'makes a move given a cell number and a symbol' do
    board.make_move(4, 'x')
    expect(board.available_cells).to eq([0, 1, 2, 3, 5, 6, 7, 8])
  end

  it 'removes a move given a cell number' do
    board.make_move(4, 'x')
    expect(board.available_cells).to eq([0, 1, 2, 3, 5, 6, 7, 8])
    board.remove(4)
    expect(board.available_cells).to eq([0, 1, 2, 3, 4, 5, 6, 7, 8])
  end

  it 'gets the available cells of the board as an array' do
    build_board(board, [2, 3, 5, 6], 'x')
    expect(board.available_cells).to eq([0, 1, 4, 7, 8])
  end

  it 'knows who the winner is' do
    build_board(board, [0, 2, 4, 6, 8], 'x')
    build_board(board, [1, 3, 5, 7], 'o')
    expect(board.get_winner).to eq('x')
  end

  it 'knows if there is not a winner' do
    build_board(board, [0, 5, 8], 'x')
    build_board(board, [1, 3, 4], 'o')
    expect(board.get_winner).to be nil
  end

  it 'knows if the board is full' do
    build_board(board, [0, 1, 2, 3, 4, 5, 6, 7, 8], 'x')
    expect(board.full?).to be true
  end

  it 'turns the board into a string to be printed' do
    build_board(board, [2, 5, 8], 'x')
    expect(board.to_s).to eq("\n   |   | x \n-----------\n   |   | x \n-----------\n   |   | x \n\n")
  end

end

