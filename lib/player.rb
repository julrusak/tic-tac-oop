class Player
  attr_accessor :piece
  def initialize
    @piece = ''
  end

  def assign_piece
    puts "\n\n Choose your piece. \n\n 'X' or 'O'"
    loop do
      @piece = gets.chomp.upcase
      return @piece if @piece == 'X' || @piece == 'O'
      puts "error piece has to be X or O"
    end
  end

  def player_move
    puts "\n What's your move: "
    board.show_board
    player_choice = gets.chomp.to_i
    if game.valid_move?(player_choice)
    	return player_choice
      # board.move(player_choice, player.piece)
    else
      puts "Please make a valid move, number 1 - 9 in an available spot!"
      player_move
    end 
  end

end