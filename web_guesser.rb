require 'sinatra'
require 'sinatra/reloader'

number = rand(101)
@@guesses = 5


get '/' do
  guess = params["guess"]
  message = check_nums(guess.to_i, number)
  guess_message, number = check_guesses(number, guess)
  erb :index, :locals => {:guess => guess, :message => message, :guess_message => guess_message}
end

def check_nums(guess, number)
  if guess == 0
    ""
  elsif guess > number && (guess - number) > 5
    "Way too high!"
  elsif guess > number
    "Too high!"
  elsif guess < number && (number - guess) > 5
    "Way too low!"
  elsif guess < number
    "Too low!"
  elsif guess == number
    "You got it right!"
  end
end

def check_guesses(number, guess)
  if guess.to_i == number
    @@guesses = 4
    number = rand(101)
    guess_message = "You guessed correctly! Play again!"
    return guess_message, number
  elsif @@guesses == 0
    @@guesses = 4
    number = rand(101)
    guess_message = "Sorry you lost! Play again! A new number has been generated."
    return guess_message, number
  else
    @@guesses -= 1
    guess_message = ""
    return guess_message, number
  end
end
