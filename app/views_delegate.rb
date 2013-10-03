libdir = File.dirname("app/config")
$LOAD_PATH.unshift(libdir) unless $LOAD_PATH.include?(libdir)
require 'config'
require 'playerClass'
require 'gameClass'


get '/' do
  erb :index
end

post '/play' do
  @player1 = Player.new(params[:name])
  @player2isAI = params[:ai]
  if @player2isAI
    @player2 = Player.new("AI Opponent")
  else
    #name should come from DB once set up
    @player2 = Player.new("Player 2")
  end
  @players = [@player1, @player2]
  @game = Game.new(@players, @player2isAI)
  @game.setup
  @diff_choice = params[:diff]
  erb :play
end

get '/startturn' do
  # @game.turns
end


get '/instr.erb' do
  erb :instr
end

# helpers do

# end
