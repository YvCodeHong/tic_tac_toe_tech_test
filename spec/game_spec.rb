require 'game'

describe Game do

  subject( :game ){ described_class.new( board ) }
  let( :player_x ){ double :player_x }
  let( :player_o ){ double :player_o }
  let( :player_p ){ double :player_p }
  let( :board    ){ double :board    }

  context "#add_player" do
    it "should add player" do
      game.add_player( player_x )
      expect( game.player1 ).to eq( player_x )
    end

    it "should add the player to player2 when player1 exist" do
      game.add_player( player_x )
      game.add_player( player_o )
      expect( game.player1 ).to eq( player_x )
      expect( game.player2 ).to eq( player_o )
    end

    it "should not add any players when player1 and player2 exist" do
      game.add_player( player_x )
      game.add_player( player_o )
      expect{ game.add_player( player_p ) }.to raise_error( "Already two players exist" )
    end
  end

  context "#start" do
    it "should start a game with two players" do
      game.add_player( player_x )
      game.add_player( player_o )
      game.start
      expect( game.player1 ).to eq( player_x )
      expect( game.player2 ).to eq( player_o )
    end

    it "should raise an error when there are not two players" do
      # No player
      expect{ game.start }.to raise_error( "To start, require two players" )
      # One player
      game.add_player( player_x )
      expect{ game.start }.to raise_error( "To start, require two players" )
    end

    it "should set turn for player1" do
      game.add_player( player_x )
      game.add_player( player_o )
      game.start
      expect( game.current_player ).to eq( player_x )
    end
  end

  context "#claim_field" do

    before(:each) do
      game.add_player( player_x )
      game.add_player( player_o )
      game.start
      allow( board ).to receive( :take_field )
    end

    it "should change turn when a player claims a field" do
      allow( board ).to receive( :win? ).and_return( false )
      allow( board ).to receive( :all_fields_taken? ).and_return( false )
      game.claim_field(1,1)
      expect( game.current_player ).to eq( game.player2 )
      game.claim_field(3,3)
      expect( game.current_player ).to eq( game.player1 )
    end

    context "when it is draw" do
      it "should return a message and set over setter true" do
        allow( board ).to receive( :win? ).and_return( false )
        allow( board ).to receive( :all_fields_taken? ).and_return( true )
        expect( game.claim_field(1,1) ).to eq( "draw!" )
        expect( game.over ).to eq( true )
      end
    end

    context "when a player won" do
      it "should return a message and set over setter true" do
        allow( board ).to receive( :win? ).and_return( true )
        allow( board ).to receive( :all_fields_taken? ).and_return( false )
        game.current_player = player_x
        expect( game.claim_field(1,1) ).to eq( "#{player_x} win!" )
        expect( game.over ).to eq( true )
      end
    end

  end

end
