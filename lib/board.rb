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
    size.times do
      row = []
      size.times{ row << false }
      self.all_fields << row
    end
  end

end
