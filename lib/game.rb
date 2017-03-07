require_relative './player.rb'
require_relative './board.rb'

class Game

  attr_accessor :current_player, :board, :over
  attr_reader :player1, :player2

  def initialize( board )
    self.board = board
    self.over = false
  end

  def add_player( player )
    raise "Already two players exist" if player2_exist?
    player1_exist? ? @player2 = player : @player1 = player
  end

  def start
    raise "To start, require two players" if !player2_exist?
    set_player1_turn
  end

  def claim_field( row, column )
    board.take_field( row, column, self.current_player )
    set_game_over if game_over?
    self.over == true ? display_game_over_message : change_turn
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

  def change_turn
    previous_turn_by_player1? ? set_player2_turn : set_player1_turn
  end

  def set_player1_turn
    self.current_player  = player1
  end

  def set_player2_turn
    self.current_player  = player2
  end

  def game_over?
    self.board.all_fields_taken? || self.board.win?
  end

  def set_game_over
    self.over = true
  end

  def display_game_over_message
    return "#{current_player} win!" if self.board.win?
    return "draw!" if self.board.all_fields_taken?
  end

end
