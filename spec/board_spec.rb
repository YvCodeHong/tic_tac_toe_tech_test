require 'board'

describe Board do

  subject( :board ){ described_class.new(3) }
  let( :player_x ){ double :player_x }
  let( :player_o ){ double :player_o }


  it { is_expected.to respond_to :fields }

  it "should pass size" do
    expect( board.size ).to eq( 3 )
  end

  it "should create array depend on size" do
    expect( board.fields ).to eq( [[false,false,false],[false,false,false],[false,false,false]] )
  end

  context 'when size is less than 3' do
    it "should raise an error" do
      expect{ Board.new(2) }.to raise_error( "Set size more than 3" )
    end
  end

  context 'take_field' do

    it "should mark the field by the player" do
      board.take_field( 1, 1, player_x )
      expect( board.fields[0][0] ).to eq( player_x )
    end

    it "should raise an error when the field has already been taken" do
      board.take_field( 1, 1, player_x )
      expect{ board.take_field( 1, 1, player_x ) }.to raise_error( "The field has already been taken" )
    end

  end

  context "#win?" do

    # A player wins if they claim all the fields in a row, column or diagonal
    it "should give a message when a player claim all the fields in a row" do
      board.take_field( 1, 1, player_x )
      board.take_field( 1, 2, player_x )
      board.take_field( 1, 3, player_x )
      expect( board.win? ).to be( true )
    end
    it "should give a message when a player claim all the fields in a column" do
      board.take_field( 1, 1, player_x )
      board.take_field( 2, 1, player_x )
      board.take_field( 3, 1, player_x )
      expect( board.win? ).to be( true )
    end
    it "should give a message when a player claim all the fields in a diagonal" do
      board.take_field( 1, 1, player_x )
      board.take_field( 2, 2, player_x )
      board.take_field( 3, 3, player_x )
      expect( board.win? ).to be( true )
    end
  end

  context "#all_fields_taken?" do
    it "should check all fields has been taken or not" do
      board.fields = [[player_x, player_o, player_x],[player_x, player_x, player_o],[player_o, player_x, false]]
      expect( board.all_fields_taken? ).to eq( false )
      board.fields = [[player_x, player_o, player_x],[player_x, player_x, player_o],[player_o, player_x, player_o]]
      expect( board.all_fields_taken? ).to eq( true )
    end
  end

end
