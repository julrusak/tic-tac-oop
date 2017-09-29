require 'io/console'
require_relative 'board'
require_relative 'player'

class Game
	attr_reader :board, :player
	def initialize
		@board = Board.new
		@player = Player.new
		@current_turn = 0
	end

	def introduction
		puts "\e[H\e[2J \n <<<<<<<<  WELCOME TO TIC_TAC_TOE  >>>>>>>>"
		player.piece = assign_pieces
		puts "\e[H\e[2J Alright, player #{player.piece}...\n\n Here's how to play! \n Choose a number where you would like to place your #{player.piece}, here are your options.\n \n"
		puts (1..9).to_a.each_slice(3) { |row| puts row.join(" | ")}
		puts "\n\n Try to get three #{player.piece}'s in a row and you win! \n PRESS ANY KEY TO BEGIN"
		STDIN.getch 
		start
	end

	def assign_pieces
		loop do
		  puts "\n\n Choose your piece. \n\n 'X' or 'O'"
			player.piece = gets.chomp.upcase
		  return player.piece if player.piece == 'X' || player.piece == 'O'
		  puts "error piece has to be X or O"
		end
	end

	def start
		puts "Let's play"
		until winner?
			play
			winner?
			@current_turn += 1
		end
	end

	def play
		@current_turn % 2 == 0 ? player_move : computer_move
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
		if valid_move?(computer_choice)
			if board.position_taken?(computer_choice)
				computer_move
			else
				board.move(computer_choice, computer_piece)
			end
		else
			computer_move
		end 
	end

	def winner?
		return true if board.row_check || board.column_check || board.diag_check
	end

	def valid_move?(player_choice)
		player_choice.between?(1, 9) && !board.position_taken?(player_choice)
	end
end

game = Game.new
game.introduction
