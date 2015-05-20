require 'json'

file = File.read('roster.json')
@teams_info = JSON.parse(file)


def team_names
  @teams_info.keys
end

puts team_names
