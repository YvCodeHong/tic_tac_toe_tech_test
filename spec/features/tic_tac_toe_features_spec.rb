require 'game'
require 'player'
require 'web_helper'
require 'board'

describe Game, 'features' do

  let( :game ){ Game.new( Board.new(3) ) }
  let( :player_x ){ Player.new }
  let( :player_o ){ Player.new }

  before(:each) do
    game.add_player( player_x )
    game.add_player( player_o )
  end

  # There are two players in the game (X and O)
  it "should start a game with two players" do
    game.start
    expect( game.player1 ).to be( player_x )
    expect( game.player2 ).to be( player_o )
  end

  # Players take turns until the game is over
  it "should let players take turns" do
    game.start
    expect( game.current_player ).to eq player_x
    game.claim_field(1,1)
    expect( game.current_player ).to eq player_o
  end

  # A player can claim a field if it is not already taken
  it "should let a player can claim a field if it is not already taken" do
    game.start
    game.claim_field(1,1)
    expect( game.board.fields[0][0] ).to be game.player1
    expect{ game.claim_field(1,1) }.to raise_error("The field has already been taken")
  end

  # A turn ends when a player claims a field
  it "should end a turn when a player claims a field" do
    game.start
    game.claim_field(1,1)
    expect( game.current_player ).to eq game.player2
  end

  # A player wins if they claim all the fields in a row, column or diagonal
  it "should let a player wins if they claim all the fields in a row, column or diagonal" do
    # in a row
    game.start
    player = game.current_player
    game.claim_field(1,1)
    game.claim_field(2,2)
    game.claim_field(1,2)
    game.claim_field(3,3)
    expect( game.claim_field(1,3) ).to eq("#{player} win!")
    reset_board
    # in a column
    game.start
    player = game.current_player
    game.claim_field(1,1)
    game.claim_field(1,2)
    game.claim_field(2,1)
    game.claim_field(2,2)
    expect( game.claim_field(3,1) ).to eq("#{player} win!")
    reset_board
    # in a diagonal
    game.start
    player = game.current_player
    game.claim_field(1,1)
    game.claim_field(1,2)
    game.claim_field(2,2)
    game.claim_field(2,3)
    expect( game.claim_field(3,3) ).to eq("#{player} win!")
    reset_board
    # in a diagonal
    game.start
    player = game.current_player
    game.claim_field(1,3)
    game.claim_field(1,1)
    game.claim_field(2,2)
    game.claim_field(2,1)
    expect( game.claim_field(3,1) ).to eq("#{player} win!")
  end

  # A game is over if a player wins
  it "should game over if a player wins" do
    game.start
    game.claim_field(1,1)
    game.claim_field(2,2)
    game.claim_field(1,2)
    game.claim_field(3,3)
    game.claim_field(1,3)
    expect( game.over ).to eq true
  end

  # A game is over when all fields are taken
  it "should game over when all fields are taken" do
    game.start
    game.board.fields = [ [player_x, player_o, player_x],
                          [player_x, player_o, player_o],
                          [player_o, player_x, false] ]

    expect( game.claim_field(3,3) ).to eq("draw!")
    expect( game.over ).to eq true
  end

end
