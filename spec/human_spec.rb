require './lib/human'

describe Human do
  let(:player1) { Human.new('o') }

  it 'creates a new human player with a symbol' do
    expect(player1.symbol).to eq('o')
  end

  it 'gets a valid move from a human player' do
    mock_input = double(:gets => 4)
    mock_output = double(:print_string => true)
    available_moves = [2, 4, 6]

    expect(player1.get_move(available_moves, mock_input, mock_output)).to eq(4)
  end

  it 'gets an invalid move from a human player' do
    available_moves = [2, 5, 6]
    invalid_msg = "Cell not available, please select another"
    mock_output = double(:print_string => invalid_msg)
    mock_input = double(:gets => 4)

    expect(player1.get_move(available_moves, mock_input, mock_output)).to eq(invalid_msg)
  end

end

