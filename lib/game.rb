require_relative './player.rb'

class Game

  attr_accessor :player1, :player2, :current_player, :board, :over
  attr_reader :row, :column

  def initialize
    self.board = [ [false, false, false],
                   [false, false, false],
                   [false, false, false] ]
    self.over = false
  end

  def add_player( player )
    raise "Already two players exist" if player2_exist?
    player1_exist? ? self.player2 = player : self.player1 = player
  end

  def start
    raise "To start, require two players" if !player2_exist?
    set_player1_turn
    true
  end

  def change_turn
    previous_turn_by_player1? ? set_player2_turn : set_player1_turn
  end

  def claim_field( row, column )
    @row, @column = row - 1, column - 1 #change number to access board array
    raise "The field has already been taken" if field_unavailable?
    take_field
    set_game_over if all_fields_taken? || win?
    return "#{current_player} win!" if win?
    return "draw!" if all_fields_taken?
    change_turn
  end

  def win?
    got_a_row? || got_a_column? || got_a_diagonal
  end

  def set_game_over
    self.over = true
  end

  def all_fields_taken?
    board.flatten.all?
  end

  private

  def player1_exist?
    !player1.nil?
  end

  def player2_exist?
    !player2.nil?
  end

  def previous_turn_by_player1?
    self.current_player == player1
  end

  def set_player1_turn
    self.current_player = player1
  end

  def set_player2_turn
    self.current_player = player2
  end

  def take_field
    self.board[self.row][self.column] = current_player
  end

  def field_unavailable?
    board[self.row][self.column] != false
  end

  def got_a_row?
    target = board[self.row]
    all_same_player?( target )
  end

  def got_a_column?
    target = board.map.each{ |row| row[self.column] } #collect players from the column
    all_same_player?( target )
  end

  def got_a_diagonal
    number = board.count
    target = []
    for i in 0...number
      target << board[i][i]
    end
    all_same_player?( target )
  end

  def all_same_player?( target )
    target.all?{ |player| player == current_player }
  end

end
