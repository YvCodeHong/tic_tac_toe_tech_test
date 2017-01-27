class Board

  attr_accessor :fields
  attr_reader :size

  def initialize(size)
    raise "Set size more than 3" if size < 3
    @size = size
    @fields = []
    create
  end

  def create
    size.times do
      row = []
      size.times{ row << false }
      self.fields << row
    end
  end

end
