require "sinatra"
require "sinatra/reloader"
require "sinatra/activerecord"
require "./lib/survey"
require "pry"

also_reload "lib/**/*.rb"

get "/" do
  @survey_message = Survey.all.length > 0 ? "Select a Survey" : "You haven't made a survey yet!"
  erb :index
end

get "/survey/new" do
  erb :new_survey
end

post "/survey" do
  survey_name = params.fetch("survey-name")
  survey_description = params.fetch("survey-description")
  Survey.create({name: survey_name, description: survey_description})
  redirect "/"
end

get "/survey/:id" do
  id = params.fetch('id')
  @survey = Survey.find(id)
  erb :survey_view
end

patch "/survey" do
  id = params.fetch("survey_id")
  survey_name = params.fetch("survey-name")
  survey_description = params.fetch("survey-description")

  survey = Survey.find(id)
  survey.update({name: survey_name, description: survey_description})
  redirect "/survey/#{id}"
end

delete "/survey" do
  id = params.fetch('survey_id')
  survey = Survey.find(id)
  survey.delete
  redirect "/"
end
