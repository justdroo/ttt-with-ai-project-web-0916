class Board

  attr_accessor :cells

  def initialize
    @cells = self.reset!
  end

  def reset!
    @cells = Array.new(9, " ")
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
      puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(user_input)
    @cells[user_input.to_i - 1]
  end

  def full?
    !@cells.include?(" ")
  end

  def turn_count
    @cells.size - @cells.select{|cell| cell == " "}.size
  end

  def taken?(position)
    !@cells[position.to_i - 1].include?(" ")
  end

  def valid_move?(position)


    if position == "invalid" || self.taken?(position)
      false
    else
      true
    end
  end

  def update(position, player)
    
  end
end
