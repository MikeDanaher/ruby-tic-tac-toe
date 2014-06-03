require './lib/human'

describe Human do
  let(:player1) { Human.new('o') }

  it 'creates a new human player with a symbol' do
    expect(player1.symbol).to eq('o')
  end

  it 'gets a valid move from a human player' do
    mock_input = double(:get => 4)
    mock_output = double(:print_string => true)
    available_cells = [2, 4, 6]

    expect(player1.get_move(available_cells, '', mock_input, mock_output)).to eq(4)
  end

end

