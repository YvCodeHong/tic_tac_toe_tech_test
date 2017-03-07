class Board

  attr_accessor :fields
  attr_reader   :size, :row, :column, :current_player

  def initialize(size)
    raise "Set size more than 3" if size < 3
    @size = size
    @fields = []
    create_fields
  end

  def take_field( row, column, player )
    @row, @column, @current_player = row-1, column-1, player
    raise "The field has already been taken" if field_unavailable?
    self.fields[ self.row ][ self.column ] = self.current_player
  end

  def win?
    got_a_row? || got_a_column? || got_a_diagonal?
  end

  def all_fields_taken?
    self.fields.flatten.all?
  end

  private

  def create_fields
    size.times do
      row = []
      size.times{ row << false }
      self.fields << row
    end
  end

  def field_unavailable?
    self.fields[self.row][self.column] != false
  end

  def got_a_row?
    target = self.fields[self.row]
    all_same_player?( target )
  end

  def got_a_column?
    target = self.fields.map.each{ |row| row[self.column] } #collect players from the column
    all_same_player?( target )
  end

  def got_a_diagonal?
    all_same_player?( get_players_from_one_diagonal ) || all_same_player?( get_players_from_another_diagonal )
  end

  def get_players_from_one_diagonal # one diagonal / <= this way
    target = []
    for i in 0...self.size
      target << self.fields[i][i]
    end
    target
  end

  def get_players_from_another_diagonal # another diagonal \ <= this way
    target, target_column = [], self.size - 1
    for i in 0...self.size
      target << self.fields[i][target_column-i]
    end
    target
  end

  def all_same_player?( target )
    target.all?{ |player| player == self.current_player }
  end

end
