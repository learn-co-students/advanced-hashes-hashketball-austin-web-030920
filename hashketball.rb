require 'csv'
require_relative 'hashketball_helpers'

# generate the team hash first
home_csv_data = CSV.parse(File.read("home_player_data.csv", headers: true, header_converters: :symbol))
away_csv_data = CSV.parse(File.read("away_player_data.csv", headers: true, header_converters: :symbol))

# don't want to mess with creating a class
# and managing state so a global variable will work for now
$teams = {
  :home   => build_team("Brooklyn Nets", ["Black", "White"], home_csv_data),
  :away   => build_team("Charlotte Hornets", ["Turquoise", "Purple"], away_csv_data)
}

def game_hash
  $teams
end

def all_players(teams)
  # concat players from both teams
  teams[:home][:players] + teams[:away][:players]
end

def find_player_by_name(player_name)
  players = all_players($teams)
  index = 0
  while index < players.count do
    player = players[index]
    if player[:player_name] == player_name
      return player
    else
      index += 1
    end
  end
end

def find_team_by_name(team_name)

end

def num_points_scored(player_name)
  # find player by name and return points scored
  player = find_player_by_name(player_name)
  player[:points]
end

def shoe_size(player_name)
  # find player by name and return shoe size
  player = find_player_by_name(player_name)
  player[:shoe]
end

def team_colors(team_name)
  teams = $teams
  teams.each do |team_key, team|
    if (team[:team_name] == team_name)
      return team[:colors]
    end
  end
end

def team_names
  names = []
  $teams.each do |team_key, team|
    names << team[:team_name]
  end

  names
end

def player_numbers(team_name)
  numbers = []

  $teams.each do |team_key, team|
    if (team[:team_name] == team_name)
      # create a new array of Jersey numbers from array of players
      numbers = team[:players].map { |player| player[:number] }
    end
  end
  numbers
end

def player_stats(player_name)
  player = find_player_by_name(player_name)
  # player.delete(:player_name)
  player_stats = {}.merge(player)
  player_stats.delete(:player_name)
  player_stats
end

def big_shoe_rebounds
  # get player by largest shoe size
  players = all_players($teams)
  sorted = players.sort_by { |player| player[:shoe] }
  sorted[-1][:rebounds]
end

# bonus
def most_points_scored
  players = all_players($teams)
  sorted = players.sort_by { |player| player[:points] }
  sorted[-1][:player_name]
end

def winning_team
  teams = $teams
  scores = []
  teams.each do |team_key,team|
    sum_result = team[:players].reduce(0) { |sum, player| sum += player[:points] }
    scores << { :team_name => team[:team_name], :score => sum_result }
  end

  sorted = scores.sort_by { |player| player[:score]}
  sorted[-1][:team_name]
end

def player_with_longest_name
  players = all_players($teams)

  sorted = players.sort_by { |player| player[:player_name].length }
  sorted[-1][:player_name]
end
# objects:
# team
# {
#   :team_name  => "", #=> String
#   :colors     => [""],
#   :players    => []
# }

# player
# {
#   :player_name  => "" #=> String
#   :number => 0, #=> Int
#   :shoe => 0, #=> Int
#   :points => 0, #=> Int
#   :rebounds => 0, #=> Int
#   :assists  => 0, #=> Int
#   :steals => 0, #=> Int
#   :blocks => 0, #=> Int
#   :slam_dunks => 0 #=> Int
# }
