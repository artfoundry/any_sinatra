
PLAYER = 1
AI = 2

#########  Class: Player  ###########

class Player
  attr_accessor :diff_choice, :hand, :board, :name
  def initialize(name)
    @hand = { :ones => 0,
              :twos => 0,
              :threes => 0,
              :fours => 0,
              :fives => 0,
              :sixes => 0 }
    @board = {:bases => 0,
              :defenders => 0,
              :attackers => 0 }
    @name = name
    @diff_choice = ""
  end #initialize

end #Player


#########  Class: Game  ###########

class Game
  def initialize(player_info)
    @player_info = player_info
    @first_turn = roll(2)
  end #initialize

  def roll(sides)
    rand(sides) + 1
  end #roll

  def turns
    if @first_turn == 1
      playerTurn
      aiTurn
    else
      aiTurn
      playerTurn
    end
  end #turns

  def setup
    give each player one base, one power 1, and one power 2

  end

  def playerTurn
    
  end #playerTurn

  def aiTurn
  end #aiTurn

  def isWinner?
    false
  end #isWinner?
end #Game

#########  Class: Controller  ###########

class Controller
  def initialize
    player_info = [player = Player.new, ai = Player.new]
  end #initialize

  def playGame
    display = UI.new(player_info)
    game = Game.new(player_info)
    player_info = display.greetPlayer
    display.printInstructions
    display.getDifficulty
    while !game.isWinner?
      display.drawBoard
      game.turns
    end
  end #playGame
end #Controller

#########  Driver code  ###########

run = Controller.new
run.playGame
