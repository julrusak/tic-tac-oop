class Board
	attr_reader :board
	def initialize 
		@board = Array.new(9, ' ')
	end

	def move(position, player)
		 @board[position -1] = player
	end

	def position_taken?(position)
		@board[position - 1] == 'X' || @board[position - 1] == 'O' ? true : false
	end

	def show_board
		@board.each_slice(3) { |row| puts row.join(" | ")}
	end

	def row_check
		# @board.each_slice(3) { |row| puts row.all? == 'X' || row.all? == 'Y' }
		board.each_slice(3) { |row| puts row.all? {|space| space == 'X' || space == 'Y'} }
	end
end



