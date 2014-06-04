require './lib/human'
require './lib/output'
require './lib/input'

describe Human do
  let(:player1) { Human.new('o') }

  it 'creates a new human player with a symbol' do
    expect(player1.symbol).to eq('o')
  end

  it 'gets a valid move from a human player' do
    available_cells = [2, 4, 6]

    allow(Output).to receive(:print_string).and_return(true)
    allow(Input).to receive(:get_number).and_return(6)

    expect(player1.get_move(available_cells, 'Message')).to eq(6)
  end

  it 're-prompts the user until a valid move is given' do
    available_cells = [0, 2, 4, 6]

    allow(Output).to receive(:print_string).and_return(true)
    allow(Input).to receive(:get_number).exactly(3).times.and_return(nil, 5, 6)

    player1.get_move(available_cells, 'Message')
  end
end

