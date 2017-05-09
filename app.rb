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
  survey.questions.delete
  survey.delete
  redirect "/"
end

post "/question" do
  id = params.fetch("survey_id")
  survey = Survey.find(id)
  question_name = params.fetch("question-name")
  survey.questions.create(question: question_name)
  redirect "/survey/#{id}"
end

get "/question/:id" do
  question_id = params.fetch('id')
  @question = Question.find(question_id)
  erb :question_view
end

delete "/question" do
  question_id = params.fetch('question_id')
  question = Question.find(question_id)
  survey_id = question.survey_id
  question.delete
  redirect "/survey/#{survey_id}"
end
