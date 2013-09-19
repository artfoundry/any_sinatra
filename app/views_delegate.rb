require 'sinatra'

get '/' do
  erb :index
end

post '/play' do
  @player = params[:name]
  @difficulty = params[:diff]
  erb :play
end

get '/instr.erb' do
  erb :instr
end