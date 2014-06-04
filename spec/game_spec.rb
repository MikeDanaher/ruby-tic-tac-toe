require './lib/game'
require './lib/output'
require './lib/board'
require './lib/game_config'

describe Game do
  let(:game) { Game.new(GameConfig.options_3x3) }

  it 'creates a new board when starting a new game' do
    expect(game.board.size).to eq(9)
  end

  it 'ends the game when a player has three in a row' do
    mock_player1 = double('player1', :symbol => 'x')
    mock_player2 = double('player2', :symbol => 'o')

    allow(Output).to receive(:put_string).and_return(true)
    allow(mock_player1).to receive(:get_move).and_return(0, 4, 8)
    allow(mock_player2).to receive(:get_move).and_return(1, 5, 7)
    allow(game).to receive(:end_game).and_return("Player x wins")

    expect(game.play(mock_player1, mock_player2)).to eq("Player x wins")
  end

  it 'ends the game when the players tie' do
    mock_player1 = double('player1', :symbol => 'x')
    mock_player2 = double('player2', :symbol => 'o')

    allow(Output).to receive(:put_string).and_return(true)
    allow(mock_player1).to receive(:get_move).and_return(0, 2, 3, 5, 7)
    allow(mock_player2).to receive(:get_move).and_return(1, 4, 6, 8)
    allow(game).to receive(:end_game).and_return("It's a tie!")

    expect(game.play(mock_player1, mock_player2)).to eq("It's a tie!")
  end

end
