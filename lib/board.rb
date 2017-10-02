class Board
  attr_reader :board
  def initialize 
    @board = Array.new(9, ' ')
  end

  def move(position, player)
    board[position -1] = player
  end

  # determine if cell is available
  def position_taken?(position)
    board[position -1] == 'X' || board[position -1] == 'O' ? true : false
  end

  # board with filled in numbers to serve as guide
  def guide
  	(1..9).to_a.each_slice(3) { |row| puts row.join(" | ")}
  end

  def board_formatted
    board.each_slice(3).to_a
  end

  def show_board
    puts "<<BOARD>>"
    board_formatted.each { |row| puts row.join(" | ")}
  end

  # checks nested arrays for the row cell values
  def row_check
    return winning_combo?(board_formatted)
  end

  # creates new arrays of all the column cell values
  def column_check
    return winning_combo?(board_formatted.transpose)
  end

  # algorithms for finding array of diagonal boxes below
  def diag_check
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



