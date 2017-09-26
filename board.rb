class Board
	def initialize 
		@board = (1..9).to_a
	end

	def to_s
		@board.each_slice(3) { |row| puts row.join(" | ")}
	end
end


board = Board.new
puts board