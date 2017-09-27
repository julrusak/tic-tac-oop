class Board
	attr_reader :board
	def initialize 
		@board = Array.new(9, ' ')
	end

	def move(location, player)
		@board[location.to_i - 1] = player
	end

	def show_board
		@board.each_slice(3) { |row| puts row.join(" | ")}
	end
end



