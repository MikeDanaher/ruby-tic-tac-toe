require './lib/board'

describe Board do
  let(:board) { Board.new(9) }

  it 'creates a new board with a size of 9' do
    expect(board.size).to eq(9)
  end

  it 'gets the state of the current board as an array' do
    expect(board.get_state).to eq([' ',' ',' ',' ',' ',' ',' ',' ',' '])
  end

  it 'makes a move given a cell number and a symbol' do
    board.make_move(4, 'x')
    expect(board.get_state).to eq([' ',' ',' ',' ','x',' ',' ',' ',' '])
  end

  it 'knows if there is a winner' do
    board.make_move(2, 'x')
    board.make_move(5, 'x')
    board.make_move(8, 'x')
    expect(board.winner?).to be true
  end

  it 'knows if there is not a winner' do
    board.make_move(0, 'x')
    board.make_move(4, 'o')
    board.make_move(8, 'x')
    expect(board.winner?).to be false
  end

  it 'turns the board into a string to be printed' do
    board.make_move(2, 'x')
    board.make_move(5, 'o')
    board.make_move(8, 'x')
    expect(board.to_s).to eq("   |   | x \n-----------\n   |   | o \n-----------\n   |   | x \n")
  end

end

