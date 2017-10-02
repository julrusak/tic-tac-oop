# tic-tac-oop
A tic-tac-toe game using OOP in ruby!


### Installation

Clone this repo:

	$ git clone https://github.com/julrusak/tic-tac-oop.git

Move into the directory:

    $ cd tic-tac-oop

And then execute:

    $ ruby runner.rb

### Reflections / Future Modifications

A few of my thoughts on the code's maintainability and flaws. 

 - The grid is hard coded, so allowing the game to grow will require modifications in the board class. 

 - Determining current player's move is also hard coded, using an incrementing counter. This should be refactored so the game knows if player or computer is current_player and not use an algorithm for detection. 

 - There are two methods for making a board move, one for computer and one for human player - this should be refactored to one method once the previous not is implemented and the game is aware of which player is moving as opposed to a hard coded algorithm. 

### Enhancements

 - Tests!! 

 - Build tool!!

 - Allowing players to choose whether they go first or second.

 - If player chooses to play again, the winner of previous game should be the first to move. 

 - Allowing two player option!

 - Make it MVC. Right now the game is doing all the front-end work, this can be refactored out to a view and controller. 