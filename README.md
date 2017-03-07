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
2.3.1 :001 > require './lib/game.rb'
 => true
2.3.1 :002 > game = Game.new
 => #<Game:0x007fabd9aa0fc8 @board=[[false, false, false], [false, false, false], [false, false, false]], @over=false>
2.3.1 :003 > player1 = Player.new
 => #<Player:0x007fabd9a81358>
2.3.1 :004 > game.add_player( player1 )
 => #<Player:0x007fabd9a81358>
2.3.1 :005 > player2 = Player.new
 => #<Player:0x007fabd9a41cd0>
2.3.1 :006 > game.add_player( player2 )
 => #<Player:0x007fabd9a41cd0>
2.3.1 :007 > game.start
 => true
2.3.1 :008 > game.claim_field(1,1)
 => #<Player:0x007fabd9a41cd0>
2.3.1 :009 > game.claim_field(1,2)
 => #<Player:0x007fabd9a81358>
2.3.1 :010 > game.claim_field(2,1)
 => #<Player:0x007fabd9a41cd0>
2.3.1 :011 > game.claim_field(1,3)
 => #<Player:0x007fabd9a81358>
2.3.1 :012 > game.claim_field(3,1)
 => "#<Player:0x007fabd9a81358> win!"
```
