class Player
  attr_accessor :piece
  def initialize
    @piece = ''
  end

  def assign_piece(piece)
    @piece = piece
  end 
end