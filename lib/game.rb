require 'io/console'
require_relative 'board'
require_relative 'player'

class Game
  attr_reader :board, :player
  attr_accessor :current_turn
  def initialize
    @board = Board.new
    @player = Player.new
    @current_turn = 1
  end

  def introduction
    player.piece = assign_pieces
    puts "\e[H\e[2J Alright, player #{player.piece}...\n\n Here's how to play! \n Choose a number where you would like to place your #{player.piece}, here are your options.\n \n"
    board.guide
    puts "\n\n Try to get three #{player.piece}'s in a row and you win! \n PRESS ANY KEY TO BEGIN"
    STDIN.getch 
    start
  end

  def assign_pieces
      puts "\n\n Choose your piece. \n\n 'X' or 'O'"
    loop do
      player.piece = gets.chomp.upcase
      return player.piece if player.piece == 'X' || player.piece == 'O'
      puts "error piece has to be X or O"
    end
  end

  def start
    while true
      play
      if game_over?
      	end_game
      	return
      end
      self.current_turn += 1
    end
  end

  def play
    self.current_turn % 2 == 0 ? computer_move : player_move
  end

  def player_move
    puts "\n What's your move: "
    board.show_board
    player_choice = gets.chomp.to_i
    if valid_move?(player_choice)
      board.move(player_choice, player.piece)
    else
      puts "Please make a valid move, number 1 - 9 in an available spot!"
      player_move
    end 
  end

  def computer_move
    computer_choice = rand(1..9)
    player.piece == 'X' ? computer_piece = 'O' : computer_piece = 'X'
    valid_move?(computer_choice) ? board.move(computer_choice, computer_piece) : computer_move
  end

  def play_again?
    puts "Would you like to play again? (Y)"
    response = gets.chomp.upcase
    if response == "Y" || response == "YES"
      restart
    else
      puts "\e[H\e[2J \n Thanks for playing. Goodbye!"
    end
  end
  
  def valid_move?(square)
    square.between?(1, 9) && !board.position_taken?(square)
  end

  def game_over?
    return true if winner? || draw?
   end

  def winner?
    return true if board.row_check || board.column_check || board.diag_check
  end

  def draw?
    !board.board.map.any? { |cell| cell == ' ' }
  end

  def end_game
    puts "\e[H\e[2J \n"
    board.show_board
    if draw?
      puts "It's a draw!"
    else
      self.current_turn % 2 == 0 ? (puts "Game Over") : (puts "Congratulations, you won!")
    end
    play_again?
  end
  
  def restart
    board.clear
    introduction 
    self.current_turn = 1
  end
end

