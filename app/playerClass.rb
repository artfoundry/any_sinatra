class Player
  attr_accessor :hand, :board, :name
  def initialize(name)
    @hand =  Array.new(6)
    @board = {:bases => 0,
              :defenders => 0,
              :attackers => 0 }
    @name = name
  end #initialize

end #Player