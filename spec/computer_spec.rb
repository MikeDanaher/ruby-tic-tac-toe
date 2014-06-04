require './lib/computer'

describe Computer do
  let(:cpu) { Computer.new('pc') }

  it 'creates a new computer player with a given symbol' do
    expect(cpu.symbol).to eq('pc')
  end

  it "automatically chooses it's next move given the available moves" do
    available_cells = [0, 2, 3, 5, 7, 8]
    cpu_move = cpu.get_move(available_cells)

    expect(available_cells.include?(cpu_move)).to be true
  end

end
