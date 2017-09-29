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
	    return true if row.all? {|space| space == 'X' || space == 'O'}  # return from find
	  end
	  false
	end

	def column_check
		board_formatted.transpose.each do |column|
	    return true if column.all? {|space| space == 'X' || space == 'O'}  # return from find
	  end
	  false
	end

	def diag_check
		# algorithms for finding array of correct boxes below
		diag_1 = (0..2).collect { |i| new_board[i][i] }
		diag_2 = (0..2).collect { |i| new_board.reverse[i][i] }
		[diag_1, diag_2].each do |diag|
    	return true if diag.all? {|space| space == 'X' || space == 'Y'}
  	end
	end
end



