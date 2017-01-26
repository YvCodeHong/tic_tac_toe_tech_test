class Game

  attr_accessor :player1, :player2

  def add_player( player )
    raise "Already two players exist" if player2_exist?
    player1_exist? ? self.player2 = player : self.player1 = player
  end

  def start
    raise "To start, require two players" if !player2_exist?
    true
  end

  private

  def player1_exist?
    !player1.nil?
  end

  def player2_exist?
    !player2.nil?
  end

end
