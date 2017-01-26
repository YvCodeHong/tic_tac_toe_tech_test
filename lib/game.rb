class Game

  attr_accessor :player1, :player2

  def add_player( player )
    raise "Already two players exist" if !player2.nil?
    player1.nil? ? self.player1 = player : self.player2 = player
  end

end
