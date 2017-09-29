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
		board_formatted.each do |row|
			if row[0] != ' '
	    	return true if row.all? {|space| space == row[0]}  # return from find
		  end
	  end
	  false
	end

	def column_check
		board_formatted.transpose.each do |column|
			if column[0] != ' '
		    return true if column.all? {|space| space == column[0]}  # return from find
		  end
	  end
	  false
	end

	def diag_check
		# algorithms for finding array of correct boxes below
		diag_1 = (0..2).collect { |i| board_formatted[i][i] }
		diag_2 = (0..2).collect { |i| board_formatted.reverse[i][i] }
		[diag_1, diag_2].each do |diag|
			if diag[0] != ' '
    		return true if diag.all? {|space| space == diag[0]}
	  	end
  	end
  	false
	end
end



