require "sinatra"

require 'json'

file = File.read('roster.json')
teams_info = JSON.parse(file)

team_names = []
positions = {}

teams_info.each do |team, info|
  team_names << team
  info.each do |position, name|
    positions[position] = []
  end
end

teams_info.each do |team, info|
  team_names << team
  info.each do |position, name|
    positions[position] << name
  end
end

print teams_info
print positions

get "/" do
  erb :index, locals: { team_names: team_names, positions: positions }
end

get "/teams/:team_name" do
  erb :team, locals: { team_name: params[:team_name], teams_info: teams_info }
end

get "/positions/:position" do
  erb :positions, locals: { position: params[:position], positions: positions }
end
