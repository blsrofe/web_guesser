require 'sinatra'
require 'sinatra/reloader'



get '/' do
  num = rand(101)
  "The SECRET NUMBER is #{num}."
end
