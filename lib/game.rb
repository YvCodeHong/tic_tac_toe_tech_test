require_relative './player.rb'

class Game

  attr_accessor :player1, :player2, :current_player, :board, :over

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
    row = row - 1       #change row number for board array
    column = column - 1 #change column number for board array
    raise "The field has already been taken" if the_field_unavailable?( row, column )
    self.board[row][column] = current_player
    if win?( row, column )
      set_game_over
      return "#{current_player} win!"
    end
    set_game_over if all_fields_taken?
    change_turn
  end

  def win?( row, column )
    got_a_row?( row, column ) || got_a_column?( row, column ) || got_a_diagonal( row, column )
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

  def the_field_unavailable?( row, column )
    board[row][column] != false
  end

  def got_a_row?( row, column )
    target = board[row]
    all_same_player?( target )
  end

  def got_a_column?( row, column )
    target = board.map.each{ |row| row[column] } #collect players from the column
    all_same_player?( target )
  end

  def got_a_diagonal( row, column )
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
