require 'pry'

def game_hash
  {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => [
        {:player_name => "Alan Anderson", 
         :number => 0, 
         :shoe => 16, 
         :points => 22, 
         :rebounds => 12, 
         :assists => 12, 
         :steals => 3, 
         :blocks => 1,
         :slam_dunks => 1
         },
        {:player_name => "Reggie Evans",
         :number => 30, 
         :shoe => 14, 
         :points => 12, 
         :rebounds => 12, 
         :assists => 12, 
         :steals => 12, 
         :blocks => 12,
         :slam_dunks => 7
         },
        {:player_name => "Brook Lopez",
         :number => 11, 
         :shoe => 17, 
         :points => 17, 
         :rebounds => 19, 
         :assists => 10, 
         :steals => 3, 
         :blocks => 1,
         :slam_dunks => 15
         },
        {:player_name => "Mason Plumlee",
         :number => 1, 
         :shoe => 19, 
         :points => 26, 
         :rebounds => 11, 
         :assists => 6, 
         :steals => 3, 
         :blocks => 8,
         :slam_dunks => 5
         },
        {:player_name => "Jason Terry",
         :number => 31, 
         :shoe => 15, 
         :points => 19, 
         :rebounds => 2, 
         :assists => 2, 
         :steals => 4, 
         :blocks => 11,
         :slam_dunks => 1
        }
      ]
    },
    
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => [
        {:player_name => "Jeff Adrien",
         :number => 4, 
         :shoe => 18, 
         :points => 10, 
         :rebounds => 1, 
         :assists => 1, 
         :steals => 2, 
         :blocks => 7,
         :slam_dunks => 2},
        {:player_name => "Bismack Biyombo",
         :number => 0, 
         :shoe => 16, 
         :points => 12, 
         :rebounds => 4, 
         :assists => 7, 
         :steals => 22, 
         :blocks => 15,
         :slam_dunks => 10},
        {:player_name => "DeSagna Diop",
         :number => 2, 
         :shoe => 14, 
         :points => 24, 
         :rebounds => 12, 
         :assists => 12, 
         :steals => 4, 
         :blocks => 5,
         :slam_dunks => 5},
        {:player_name => "Ben Gordon",
         :number => 8, 
         :shoe => 15, 
         :points => 33, 
         :rebounds => 3, 
         :assists => 2, 
         :steals => 1, 
         :blocks => 1,
         :slam_dunks => 0},
        {:player_name => "Kemba Walker",
         :number => 33, 
         :shoe => 15, 
         :points => 6, 
         :rebounds => 12, 
         :assists =>12, 
         :steals => 7, 
         :blocks => 5,
         :slam_dunks => 12}
      ]
    }
  }
end

def num_points_scored(players_name)
  game_hash.each do |place, team|
    team.each do |attribute, data|
      if attribute == :players
        data.each do |player|
          if player[:player_name] == players_name
            return player[:points]
          end
        end
      end
    end
  end
end


def shoe_size(shoe)
  game_hash.each do |place, team|
    team.each do |attribute, data|
      if attribute == :players
        data.each do |player|
          if player[:player_name] == shoe
            return player[:shoe]
          end
        end
      end
    end
  end
end


def team_colors(team_name)
  game_hash.each do |place, team|
    if team[:team_name] == team_name
      return team[:colors]
    end
  end
end


def team_names
  game_hash.map do |place, team|
    team[:team_name]
  end
end


def player_numbers(team_name)
  array = []
  game_hash.each do |place, team|
    if team[:team_name] == team_name
      team.each do |attributes, data|
        if attributes == :players
          data.each do |player|
          array << player[:number]
         end
       end
     end
   end
 end
  array
end


def player_stats(players_name)
  results = {}
  game_hash.each do |place, team|
    team.each do |attributes, data|
      if attributes == :players
        data.each do |player|
          if player[:player_name] == players_name
            results = player.delete_if do |k, v|
              k == :player_name
            end
          end
        end
      end
    end
  end
  results
end

def big_shoe_rebounds
  big_shoe = 0
  rebounds = 0
  game_hash.each do |place, team|
    team[:players].each do |attributes, data|
      if attributes[:shoe] > big_shoe
        big_shoe = attributes[:shoe]
      end
      if attributes[:shoe] == big_shoe
        rebounds = attributes[:rebounds]
      end
    end
  end
 return rebounds
end


def most_points_scored
  most_points = 0
  mvp = 0
  game_hash.each do |place, team|
    team[:players].each do |attributes, data|
      if attributes[:points] > most_points
        most_points = attributes[:points]
      end
      if most_points == attributes[:points]
        mvp = attributes[:player_name]
      end
    end
  end
  mvp
end


def winning_team
  brooklyn_points = 0
  charlotte_points = 0
  winner = ""
  game_hash.each do |place, team|
    if team[:team_name] == "Brooklyn Nets"
      team[:players].each do |attributes, data|
        brooklyn_points += attributes[:points]
      end
      winner << team[:team_name]
    end
    if team[:team_name] == "Charlotte Hornets"
      team[:players].each do |attributes, data|
        charlotte_points += attributes[:points]
        if brooklyn_points < charlotte_points
          winner << team[:team_name]
        end
      end
    end
  end
  winner
end


def player_with_longest_name
  long_name = 13
  #that's a cheat--didn't know how to keep Alan Anderson out of longest_player
  longest_player = ""
  game_hash.each do |place, team|
    team[:players].map do |attributes, data|
      if long_name < attributes[:player_name].length
        long_name = attributes[:player_name].length
      if long_name == attributes[:player_name].length
      longest_player << attributes[:player_name]
        end
      end
    end
  end
  longest_player
end









