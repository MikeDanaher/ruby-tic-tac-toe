require './lib/game_config'
require './lib/board'
require './lib/computer'

describe Computer do
  let(:cpu) { Computer.new('pc') }
  let(:board) { Board.new(GameConfig.options_3x3) }

  def build_board(board, moves, symbol)
    moves.each { |move| board.make_move(move, symbol) }
  end

  it 'creates a new computer player with a given symbol' do
    expect(cpu.symbol).to eq('pc')
  end

  describe "get moves at beginning of game" do
    it "chooses a corner if the opponent chooses center and a corner" do
      opponent_symbol = 'x'
      corners = [2, 6]
      board.make_move(4, 'x')
      board.make_move(0, 'pc')
      board.make_move(8, 'x')

      expect(corners).to include(cpu.get_move(board, opponent_symbol))
    end

    it "chooses a side if the opponent chooses opposite corners" do
      opponent_symbol = 'x'
      sides = [1, 3, 5, 7]
      board.make_move(0, 'x')
      board.make_move(4, 'pc')
      board.make_move(8, 'x')

      expect(sides).to include(cpu.get_move(board, opponent_symbol))
    end

  end

  describe "get moves towards end of game" do
    it "returns a blocking move given the opponent could win" do
      opponent_symbol = 'x'
      build_board(board, [0, 2, 3, 7], 'x')
      build_board(board, [1, 4, 5], 'pc')

      expect(cpu.get_move(board, opponent_symbol)).to eq(6)
    end

    it "returns a winning move given the computer could win or block" do
      opponent_symbol = 'x'
      build_board(board, [1, 2, 3, 4], 'x')
      build_board(board, [0, 6, 7], 'pc')

      expect(cpu.get_move(board, opponent_symbol)).to eq(8)
    end

  end

end
