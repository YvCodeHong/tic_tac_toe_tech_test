require 'board'

describe Board do

  subject( :board ){ described_class.new(3) }

  it { is_expected.to respond_to :fields }

  it "should pass size" do
    expect( board.size ).to eq 3
  end

  it "should create array depend on size" do
    expect( board.fields ).to eq [[false,false,false],[false,false,false],[false,false,false]]
  end

  context 'when size is less than 3' do
    it "should raise an error" do
      expect{ Board.new(2) }.to raise_error("Set size more than 3")
    end
  end

end
