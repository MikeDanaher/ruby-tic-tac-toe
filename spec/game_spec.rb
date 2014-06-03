require './lib/game'
require './lib/board'

describe Game do

  it 'starts a new game with two player symbols' do
    game = Game.new('x', 'o')
    expect(game.player1.symbol).to eq('x')
    expect(game.player2.symbol).to eq('o')
  end

  it 'creates a new board when starting a new game' do
    game = Game.new('x', 'o')
    expect(game.board).to be_a(Board)
  end

end
