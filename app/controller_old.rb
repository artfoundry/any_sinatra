
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
