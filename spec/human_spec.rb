require './lib/human'
require './lib/output'
require './lib/input'
require './lib/board'

describe Human do
  let(:player1) { Human.new('o') }
  let(:board) { Board.new(GameConfig.options_3x3) }

  def build_board(board, moves, symbol)
    moves.each { |move| board.make_move(move, symbol) }
  end

  it 'creates a new human player with a symbol' do
    expect(player1.symbol).to eq('o')
  end

  it 'gets a valid move from a human player' do
    build_board(board, [0, 1, 2, 4, 6, 8], 'x')

    allow(Output).to receive(:print_string).and_return(true)
    allow(Input).to receive(:get_number).and_return(3)

    expect(player1.get_move(board, 'o', 'Message')).to eq(3)
  end

  it 're-prompts the user until a valid move is given' do
    build_board(board, [0, 1, 2, 4, 6, 8], 'x')

    allow(Output).to receive(:print_string).and_return(true)
    allow(Input).to receive(:get_number).exactly(3).times.and_return(nil, 6, 7)

    player1.get_move(board, 'o', 'Message')
  end
end

