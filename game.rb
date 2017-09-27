require_relative 'board'

class Game
	attr_reader :board
	def initialize
		@board = Board.new
		@player = Player.new
	end

	def introduction
		puts "\e[H\e[2J \n <<<<<<<<  WELCOME TO TIC_TAC_TOE  >>>>>>>>"
		piece = assign_pieces
		puts "\e[H\e[2J Alright, player #{piece}...\n\n Here's how to play! \n Choose a number where you would like to place your #{piece}, here are your options.\n \n"
		puts (1..9).to_a.each_slice(3) { |row| puts row.join(" | ")}
		puts "\n\n Try to get three #{piece}'s in a row and you win! \n Are you ready to play?? (Y/N)"
	end

	def assign_pieces
		loop do
		  puts "\n\n Choose your piece. \n\n 'X' or 'O'"
			piece = gets.chomp.upcase
		  return piece if piece == 'X' || piece == 'O'
		  puts "error piece has to be X or O"
		end
	end

	def play
		
	end
end

game = Game.new
game.introduction
