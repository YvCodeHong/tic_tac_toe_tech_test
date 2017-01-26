require 'board'

describe Board do

  subject( :board ){ described_class.new }

  it { is_expected.to respond_to :all_fields }

  context '#create' do
    it "should pass size" do
      board.create(3)
      expect( board.size ).to eq 3
    end
    it "should create array depend on size" do
      board.create(3)
      expect( board.all_fields ).to eq [[false,false,false],[false,false,false],[false,false,false]]
    end
    it "should raise an error when size is less than 3" do
      expect{ board.create(2) }.to raise_error("Set size more than 3")
    end
  end

end
