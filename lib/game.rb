class Game

  attr_accessor :player1, :player2, :current_player, :board

  def initialize
    self.board = { 1-1=>false, 1-2=>false, 1-3=>false,
                   2-1=>false, 2-2=>false, 2-3=>false,
                   3-1=>false, 3-2=>false, 3-3=>false }
  end

  def add_player( player )
    raise "Already two players exist" if player2_exist?
    player1_exist? ? self.player2 = player : self.player1 = player
  end

  def start
    raise "To start, require two players" if !player2_exist?
    set_player1_current_player
    true
  end

  def change_current_player
    previous_turn_by_player1? ? set_player2_current_player : set_player1_current_player
  end

  def claim_field( row, column )
    self.board[row-column] = self.current_player
  end

  private

  def player1_exist?
    !player1.nil?
  end

  def player2_exist?
    !player2.nil?
  end

  def previous_turn_by_player1?
    self.current_player == self.player1
  end

  def set_player1_current_player
    self.current_player = self.player1
  end

  def set_player2_current_player
    self.current_player = self.player2
  end

end
