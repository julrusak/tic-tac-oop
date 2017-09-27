require 'io/console'
require_relative 'board'
require_relative 'player'

class Game
	attr_reader :board
	def initialize
		@board = Board.new
		@player = Player.new
	end

	def introduction
		puts "\e[H\e[2J \n <<<<<<<<  WELCOME TO TIC_TAC_TOE  >>>>>>>>"
		@player.piece = assign_pieces
		puts "\e[H\e[2J Alright, player #{@player.piece}...\n\n Here's how to play! \n Choose a number where you would like to place your #{@player.piece}, here are your options.\n \n"
		puts (1..9).to_a.each_slice(3) { |row| puts row.join(" | ")}
		puts "\n\n Try to get three #{@player.piece}'s in a row and you win! \n PRESS ANY KEY TO BEGIN"
		STDIN.getch 
		play()
	end

	def assign_pieces
		loop do
		  puts "\n\n Choose your piece. \n\n 'X' or 'O'"
			@player.piece = gets.chomp.upcase
		  return @player.piece if @player.piece == 'X' || @player.piece == 'O'
		  puts "error piece has to be X or O"
		end
	end

	def play
		puts "Let's play"
	end
end

game = Game.new
game.introduction
