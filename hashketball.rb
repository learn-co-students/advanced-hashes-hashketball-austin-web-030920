require 'pry'

def game_hash
  game_data = {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [
        {
          player_name: "Alan Anderson",
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        {
          player_name: "Reggie Evans",
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        {
          player_name: "Brook Lopez",
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        {
          player_name: "Mason Plumlee",
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 11,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        {
          player_name: "Jason Terry",
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      ]
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [
        {
          player_name: "Jeff Adrien",
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        {
          player_name: "Bismack Biyombo",
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 22,
          blocks: 15,
          slam_dunks: 10
        },
        {
          player_name: "DeSagna Diop",
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        {
          player_name: "Ben Gordon",
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        {
          player_name: "Kemba Walker",
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 7,
          blocks: 5,
          slam_dunks: 12
        }
      ]
    }
  }
  # binding.pry
  game_data
end

def num_points_scored(team_member)
  game_hash.each do |(place, team)|
    # binding.pry
    team.each do |(attribute, data)|
      if attribute == :players
        data.each do |player|
          if player[:player_name] == team_member
            return player[:points]
          end
        end
      end
      # binding.pry
    end
  end
end

def shoe_size(team_member)
  game_hash.each do |(place, team)|
    # binding.pry
    team.each do |(attribute, data)|
      # binding.pry
      if attribute == :players
        data.each do |player|
          if player[:player_name] == team_member
            return player[:shoe]
          end
        end
      end
      # binding.pry
    end
  end
end

def team_colors(team_name)
  game_hash.each do |(place, team)|
    # binding.pry
    if team[:team_name] == team_name
      team.each do |(attribute, data)|
        # binding.pry
        if attribute == :colors
          return data
        end
      end
    end
      # binding.pry
  end
end

def team_names
  name_list = []
  game_hash.each do |(place, team)|
    # binding.pry
    team.each do |(attribute, data)|
      if attribute == :team_name
        name_list << data
      end
    end
      # binding.pry
  end
  # binding.pry
  name_list
end

def player_numbers(team_name)
  number_list = []
  game_hash.each do |(place, team)|
    if team[:team_name] == team_name
      team.each do |(attribute, data)|
        if attribute == :players
          player_counter = 0
          while player_counter < data.length
            # binding.pry
            number_list << data[player_counter][:number]
            player_counter += 1
          end
        end
      end
    end
  end
  number_list
end

def player_stats(given_player)

  game_hash.each do |(place, team)|
    team.each do |(attribute, data)|
      # binding.pry
      if attribute == :players
        data.each do |player|
          # player.each do |(stat, value)|
            if player[:player_name] == given_player
              player_hash = player
              # binding.pry
              player_hash.delete(:player_name)
              return player_hash
            end
            # binding.pry
          # end
        end
      end
    end
  end
end

def big_shoe_rebounds
  biggest_shoe = 0
  biggest_shoe_player = ""
  game_hash.each do |(place, team)|
    team.each do |(attribute, data)|
      if attribute == :players
        data.each do |player|
          if player[:shoe] > biggest_shoe
            biggest_shoe = player[:shoe]
            biggest_shoe_player = player[:player_name]
            # binding.pry
          end
        end
      end
    end
  end
  # binding.pry
  game_hash.each do |(place, team)|
    team.each do |(attribute, data)|
      if attribute == :players
        data.each do |player|
          if player[:player_name] == biggest_shoe_player
            return player[:rebounds]
          end
        end
      end
    end
  end
end

def most_points_scored
  most_points = 0
  highest_scorer = ""
  game_hash.each do |(place, team)|
    team.each do |(attribute, data)|
      if attribute == :players
        data.each do |player|
          if player[:points] > most_points
            most_points = player[:points]
            highest_scorer = player[:player_name]
            # binding.pry
          end
        end
      end
    end
  end
  # binding.pry
  game_hash.each do |(place, team)|
    team.each do |(attribute, data)|
      if attribute == :players
        data.each do |player|
          if player[:player_name] == highest_scorer
            return player[:player_name]
          end
        end
      end
    end
  end
end

def winning_team
  away_points = 0
  home_points = 0
  game_hash.each do |(place, team)|
    team.each do |(attribute, data)|
      if attribute == :players
        data.each do |player|
          if place == :home
            home_points += player[:points]
          else
            away_points += player[:points]
          end
        end
      end
    end
  end
  if away_points > home_points
    return game_hash[:away][:team_name]
  else
    return game_hash[:home][:team_name]
  end
end

def player_with_longest_name
  longest_length = 0
  longest_name = ""
  game_hash.each do |(place, team)|
    team.each do |(attribute, data)|
      if attribute == :players
        data.each do |player|
          if player[:player_name].length > longest_length
            longest_length = player[:player_name].length
            longest_name = player[:player_name]
            # binding.pry
          end
        end
      end
    end
  end
  # binding.pry
  game_hash.each do |(place, team)|
    team.each do |(attribute, data)|
      if attribute == :players
        data.each do |player|
          if player[:player_name] == longest_name
            return player[:player_name]
          end
        end
      end
    end
  end
end
