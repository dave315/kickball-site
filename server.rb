require "sinatra"

require 'json'

file = File.read('roster.json')
teams_info = JSON.parse(file)

team_names = []
positions = []

teams_info.each do |team, info|
  team_names << team
  positions << info
end


get "/teams" do
  erb :index, locals: { team_names: team_names }
end

get "/teams/:team_name" do

  erb :show, locals: { team_name: params[:team_name], teams_info: teams_info }
end

# get "/teams/:position" do
#   erb :show, locals: { team_name: params[:team_name], teams_info: teams_info }
# end
