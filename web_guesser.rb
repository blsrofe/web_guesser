require 'sinatra'
require 'sinatra/reloader'

number = rand(101)

get '/' do
  guess = params["guess/"].to_i
  message = check_nums(guess, number)
  erb :index, :locals => {:number => number, :message => message}
end

def check_nums(guess, number)
  if guess > number
    message = "Too high!"
  end
  message
end
