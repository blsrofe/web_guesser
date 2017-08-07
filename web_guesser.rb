require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = rand(101)


get '/' do
  guess = params["guess"]
  message = check_nums(guess.to_i)
  erb :index, :locals => {:number => SECRET_NUMBER, :message => message}
end

def check_nums(guess)
  if guess == 0
    ""
  elsif guess > SECRET_NUMBER && (guess - SECRET_NUMBER) > 5
    "Way too high!"
  elsif guess > SECRET_NUMBER
    "Too high!"
  elsif guess < SECRET_NUMBER && (SECRET_NUMBER - guess) > 5
    "Way too low!"
  elsif guess < SECRET_NUMBER
    "Too low!"
  elsif guess == SECRET_NUMBER
    "You got it right!"
  end
end
