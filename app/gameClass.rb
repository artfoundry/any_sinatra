class Game
  def initialize(players, player2isAI)
    @players = players
    @player2isAI = player2isAI
    @first_turn = roll(2)
    @first_turn == 0 ? @second_turn = 1 : @second_turn = 0
    @sides = 6
  end #initialize

  def roll(sides = @sides)
    rand(sides) + 1
  end #roll

  def setup
    (0..1).each do |player|
      (0..5).each do |unit| 
        if unit < 2
          @players[player].hand[unit] = 1
        else
          @players[player].hand[unit] = 0
        end
      end
    end
    @players[0].board[:bases] = 1
    @players[1].board[:bases] = 1
  end #setup

  def playerTurn(playerNum)
    #hand out new units based on num of opponent's bases
    playerNum == 0 ? opponent = 1 : opponent = 0
    numNewUnits = @players[opponent].board[:bases]
    numNewUnits.times do |unit| 
      unit = roll(@sides) + 1
      @players[playerNum].hand[unit] += 1
    end
  end #playerTurn

  # def aiTurn

  # end #aiTurn

  def turns
    if @player2isAI
      # order player and ai turns
    else
      (@first_turn..@second_turn).each {|num| playerTurn[num]}
    end
  end #turns

  def isWinner?
    false
  end #isWinner?
end #Game