require 'pry'
class Game

  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]

  def initialize (player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    if @board.cells.count(@player_1.token) > @board.cells.count(@player_2.token)
      @player_2
    else 
      @player_1
    end 
  end 

  def over?
    @board.cells.any? { |cell| cell == " " } ? false : true
  end

  # if the index positions of one of the players match any of the 
  # index positions in WIN_COMBINATIONS, return a win

  # player_pos = 
  # {
  #   player_1 => [POS],
  #   player_2 => [POS]
  # }

  def get_player_pos(player_1, player_2)
    @player_pos = {player_1 => [], player_2 => []}
    @board.cells.each_with_index do |player_token, i|
      if player_token == @player_1.token
        @player_pos[player_1] << i
      elsif player_token == @player_2.token
        @player_pos[player_2] <<  i
      else
        next
      end
    end
  end 

  def won?
    self.get_player_pos(@player_1, @player_2)
    WIN_COMBINATIONS.find do |win_set| 
      win_set - @player_pos[player_1] == [] || win_set - @player_pos[player_2] == []
    end 
  end 

  def draw?
    true if !self.won?
  end

  def winner
    self.get_player_pos(@player_1, @player_2)
    if self.won? && WIN_COMBINATIONS.find { |win_set| win_set - @player_pos[player_1] == [] }
      @player_1.token
    elsif self.won? && WIN_COMBINATIONS.find { |win_set| win_set - @player_pos[player_2] == [] }
      @player_2.token
    else 
      nil
    end
  end 

end
