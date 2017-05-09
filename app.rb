require "sinatra"
require "sinatra/reloader"
require "./lib/survey"
require "pry"

also_reload "lib/**/*.rb"

get "/" do
  erb :index
end
