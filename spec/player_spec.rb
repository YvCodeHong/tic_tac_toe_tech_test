require 'player'

describe Player do

  subject( :player ){ described_class.new( "Asuka" ) }

  it "should has name" do
      expect( player.name ).to eq( "Asuka" )
  end

end
