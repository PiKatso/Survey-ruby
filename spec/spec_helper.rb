ENV["RACK_ENV"] = "test"

require "rspec"
require "pg"
require "pry"
require "sinatra/activerecord"
require "survey"

# RSpec.configure do |config|
#   config.after(:each) do
#     Department.all.each do |d|
#       d.destroy
#     end
#   end
# end
