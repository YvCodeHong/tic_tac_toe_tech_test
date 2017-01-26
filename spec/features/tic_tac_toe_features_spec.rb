require 'game'
require 'player'

describe Game, 'features' do

  let(:game){ Game.new }
  let(:player1){ Player.new }
  let(:player2){ Player.new }
  # There are two players in the game (X and O)
  it "should start a game with two players" do
    game.add_player( player1 )
    game.add_player( player2 )
    expect( game.start ).to be true
  end

  # Players take turns until the game is over

  # A player can claim a field if it is not already taken

  # A turn ends when a player claims a field

  # A player wins if they claim all the fields in a row, column or diagonal

  # A game is over if a player wins

  # A game is over when all fields are taken

end
