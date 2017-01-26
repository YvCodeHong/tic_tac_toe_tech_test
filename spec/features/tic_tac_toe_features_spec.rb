require 'game'
require 'player'

describe Game, 'features' do

  let( :game ){ Game.new }
  let( :player1 ){ Player.new }
  let( :player2 ){ Player.new }

  before(:each) do
    game.add_player( player1 )
    game.add_player( player2 )
  end

  # There are two players in the game (X and O)
  it "should start a game with two players" do
    expect( game.start ).to be true
  end

  # Players take turns until the game is over
  it "should let players take turns until the game is over" do
    game.start
    expect( game.current_player ).to eq player1
    game.change_current_player
    expect( game.current_player ).to eq player2
  end

  # A player can claim a field if it is not already taken
  it "should let a player can claim a field if it is not already taken" do
    game.start
    game.claim_field(1,1)
    expect( game.board[1-1] ).to be game.player1
    expect{ game.claim_field(1,1) }.to raise_error("The field has already been taken")
  end

  # A turn ends when a player claims a field
  it "should end a turn when a player claims a field" do
    game.start
    game.claim_field(1,1)
    expect( game.current_player ).to eq game.player2
  end

  # A player wins if they claim all the fields in a row, column or diagonal

  # A game is over if a player wins

  # A game is over when all fields are taken

end
