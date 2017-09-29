class Board
	attr_reader :board
	def initialize 
		@board = Array.new(9, ' ')
	end

	def move(position, player)
		 board[position -1] = player
	end

	def position_taken?(position)
		board[position -1] == 'X' || board[position -1] == 'O' ? true : false
	end

	def board_formatted
		board.each_slice(3).to_a
	end

	def show_board
		puts "\n <<<< BOARD >>>>"
		board_formatted.each { |row| puts row.join(" | ")}
	end

	def row_check
		return winning_combo?(board_formatted)
	end

	def column_check
	 	return winning_combo?(board_formatted.transpose)
	end

	def diag_check
		# algorithms for finding array of correct boxes below
		diag_1 = (0..2).collect { |i| board_formatted[i][i] }
		diag_2 = (0..2).collect { |i| board_formatted.reverse[i][i] }
  	return winning_combo?([diag_1, diag_2])
	end

	def winning_combo?(board)
		board.each do |squares|
			if squares[0] != ' '
				return true if squares.all? {|square| square == squares[0]}
			end
		end
		false
	end

	def clear
		@board = Array.new(9, ' ')
	end
end



