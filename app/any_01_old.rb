
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


class UI
  def initialize(player_info = {})
    @player_info = player_info
    @instr_file = "./instr.txt"
  end #initialize

  def greetPlayer
    puts "Welcome to Any, a game of combat strategy that's easy enough for anyone to learn,"
    puts "but not so easy for anyone to master!"
    # puts "How many players will there for this game, including human and AI?"
    # do
    #   print "(enter 2, 3, or 4): "
    #   @player_info[:num_players] = gets.chomp
    # while !@player_info[:num_players].match(/[234]/)
    # puts "How many of these players will be human?"
    # do
    #   print "(enter 1, 2, 3, or 4): "
    #   @player_info[:num_players] = gets.chomp
    # while !@player_info[:num_players].match(/[234]/)
    puts "What is your name?"
    @player_info[:player] = Player.new(gets.chomp)
    return @player_info
  end #greetPlayer

  def printInstructions
    puts "Would you like to read the instructions?"
    instruct_resp = ""
    while !instruct_resp.match(/[yn]/)
      print "(y or n): "
      instruct_resp = gets.chomp.downcase
    end
    if instruct_resp == "y"
      File.open(@instr_file, "r") do |file| 
        file.each {|line| puts line}
      end
    end #if
  end #instructions

  def getDifficulty
    puts "What AI difficulty do you want to play against, normal or hard?"
    while !@player_info[:player].diff_choice.match(/[nh]/)
      print "(n or h): "
      @player_info[:player].diff_choice = gets.chomp.downcase
    end
  end #getDifficulty

  def drawBoard
    puts "\e[H\e[2J" if $stdout.isatty # clear the screen
    puts "AI Opponent"
    11.times {print "-"}
    print "\n"

    5.times {|unit| print "|#{unit}"}
    print "| <- Unit number\n"
    5.times {print "| "}
    print "| <- Bases\n"
    5.times {print "| "}
    print "| <- Defenders\n"
    5.times {print "| "}
    print "| <- Attackers\n"

    11.times {print "-"}
    print "\n"

    5.times {print "| "}
    print "| <- Attackers\n"
    5.times {print "| "}
    print "| <- Defenders\n"
    5.times {print "| "}
    print "| <- Bases\n"
    5.times {|unit| print "|#{unit}"}
    print "| <- Unit number\n"

    11.times {print "-"}
    print "\n"
    puts "#{@player_info[:player].name}".center(11)
    puts ""
  end #drawBoard

end #UI


class Game
  def initialize
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

  def playerTurn
    gets
  end #playerTurn

  def aiTurn
  end #aiTurn

  def isWinner?
    false
  end #isWinner?
end #Game


class Controller
  def initialize
    player_info = {}
  end #initialize

  def playGame
    display = UI.new
    game = Game.new
    player_info = display.greetPlayer
    display.printInstructions
    display.getDifficulty
    while !game.isWinner?
      display.drawBoard
      game.turns
    end
  end #playGame
end #Controller

run = Controller.new
run.playGame
