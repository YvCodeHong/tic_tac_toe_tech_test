class Board

  attr_accessor :all_fields
  attr_reader :size

  def initialize(size)
    raise "Set size more than 3" if size < 3
    @size = size
    @all_fields = []
    create
  end

  def create
    row = []
    size.times{ row << false }
    size.times{ self.all_fields << row.dup }
  end

end
