# Tic Tac Toe

This is one of Makers Academy's challenge on Week10. The task is to write code following the brief;

### The brief

The rules of tic-tac-toe are as follows:

* There are two players in the game (X and O)
* Players take turns until the game is over
* A player can claim a field if it is not already taken
* A turn ends when a player claims a field
* A player wins if they claim all the fields in a row, column or diagonal
* A game is over if a player wins
* A game is over when all fields are taken

Build the business logic for a game of tic tac toe. It should be easy to implement a working game of tic tac toe by combining your code with any user interface, whether web or command line.

### Technology
- Ruby
- RSpec for test

### How to play
1. Clone this repository to your local
2. Open your terminal
3. Move into the folder which you cloned
4. Run this command```bundle install```
    if you are going to run tests, you should run this command
    ```
    rspec
    ```
5. Run this command```irb``` and follow below
```sh
2.3.3 :001 > require './lib/game.rb'
 => true
2.3.3 :002 > game = Game.new( Board.new(3) )
 => #<Game:0x007ff033891540 @board=#<Board:0x007ff033891608 @size=3, @fields=[[false, false, false], [false, false, false], [false, false, false]]>, @over=false>
2.3.3 :003 > player1 = Player.new( "X" )
 => #<Player:0x007ff03500a730 @name="X">
2.3.3 :004 > player2 = Player.new( "O" )
 => #<Player:0x007ff03413f778 @name="O">
2.3.3 :005 > game.add_player( player1 )
 => #<Player:0x007ff03500a730 @name="X">
2.3.3 :006 > game.add_player( player2 )
 => #<Player:0x007ff03413f778 @name="O">
2.3.3 :007 > game.start
 => #<Player:0x007ff03500a730 @name="X">
2.3.3 :008 > game.claim_field(1,1)
 => #<Player:0x007ff03413f778 @name="O">
2.3.3 :009 > game.claim_field(1,2)
 => #<Player:0x007ff03500a730 @name="X">
2.3.3 :010 > game.claim_field(2,1)
 => #<Player:0x007ff03413f778 @name="O">
2.3.3 :011 > game.claim_field(1,3)
 => #<Player:0x007ff03500a730 @name="X">
2.3.3 :012 > game.claim_field(3,1)
 => "X win!"
```
