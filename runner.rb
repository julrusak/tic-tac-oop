require_relative 'lib/game'
puts "\e[H\e[2J \n <<<<<<<<  WELCOME TO TIC_TAC_TOE  >>>>>>>>"
board = Board.new
player = Player.new
game = Game.new(board, player)
game.introduction