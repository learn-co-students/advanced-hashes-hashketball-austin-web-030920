require "pry"

def game_hash
  game_hash = {
    home: {
    team_name: "Brooklyn Nets",
    colors: ["Black","White"],
    players: [
      {player_name: "Alan Anderson",
      number: 0,
      shoe: 16,
      points: 22,
      rebounds: 12,
      assists: 12,
      steals: 3,
      blocks: 1,
      slam_dunks: 1
      },  #closes 1st player
       {player_name: "Reggie Evans",
      number: 30,
      shoe: 14,
      points: 12,
      rebounds: 12,
      assists: 12,
      steals: 12,
      blocks: 12,
      slam_dunks: 7
      },  #closes 2nd player
       {player_name: "Brook Lopez",
      number: 11,
      shoe: 17,
      points: 17,
      rebounds: 19,
      assists: 10,
      steals: 3,
      blocks: 1,
      slam_dunks: 15
      },  #closes 3rd player
       {player_name: "Mason Plumlee",
      number: 1,
      shoe: 19,
      points: 26,
      rebounds: 11,
      assists: 6,
      steals: 3,
      blocks: 8,
      slam_dunks: 5
      },  #closes 4th player
       {player_name: "Jason Terry",
      number: 31,
      shoe: 15,
      points: 19,
      rebounds: 2,
      assists: 2,
      steals: 4,
      blocks: 11,
      slam_dunks: 1
      }  #closes 5th player
      
     ] #closes "players" array
    }, #closes "home" key
      
    away: {
    team_name: "Charlotte Hornets",
    colors: ["Turquoise","Purple"],
    players: [
      {player_name: "Jeff Adrien",
      number: 4,
      shoe: 18,
      points: 10,
      rebounds: 1,
      assists: 1,
      steals: 2,
      blocks: 7,
      slam_dunks: 2
      },  #closes 1st player
       {player_name: "Bismack Biyombo",
      number: 0,
      shoe: 16,
      points: 12,
      rebounds: 4,
      assists: 7,
      steals: 22,
      blocks: 15,
      slam_dunks: 10
      },  #closes 2nd player
       {player_name: "DeSagna Diop",
      number: 2,
      shoe: 14,
      points: 24,
      rebounds: 12,
      assists: 12,
      steals: 4,
      blocks: 5,
      slam_dunks: 5
      },  #closes 3rd player
       {player_name: "Ben Gordon",
      number: 8,
      shoe: 15,
      points: 33,
      rebounds: 3,
      assists: 2,
      steals: 1,
      blocks: 1,
      slam_dunks: 0
      },  #closes 4th player
       {player_name: "Kemba Walker",
      number: 33,
      shoe: 15,
      points: 6,
      rebounds: 12,
      assists: 12,
      steals: 7,
      blocks: 5,
      slam_dunks: 12
      }  #closes 5th player
      
      ]   #closes "players" array 
    }  #closes "away"
  }  #closes whole hash
end 


def num_points_scored(name)
  game_hash.each do |loc, team|
    team[:players].each do |k, v|
      if k[:player_name] == name
        return k[:points]
      end 
    end 
  end 
end

def shoe_size(name)
  game_hash.each do |loc, team|
    team[:players].each do |k, v|
      if k[:player_name] == name 
        return k[:shoe]
      end 
    end 
  end 
end 

def team_colors(pass)
  game_hash.each do |loc, team|
    if team[:team_name] == pass 
      return team[:colors]
    end 
  end 
end 

def team_names
result = []
  game_hash.each do |loc, team|
    result << team[:team_name]
  end 
  return result
end 

def player_numbers(pass)
result = []  
  game_hash.each do |loc, team|
    if team[:team_name] == pass
      team[:players].each do |k|
        result << k[:number]
      end 
    end 
  end 
  return result
end 

def player_stats(name)
result = {}
  game_hash.each do |loc, team|
    team[:players].each do |k|
      if k[:player_name] == name 
        result = k.delete_if do |k, v|
          k == :player_name
        end 
        return result
      end 
    end 
  end 
end 

def big_shoe_rebounds
  agg = []
  game_hash.each do |loc, team|
    team[:players].each do |player_stats|
       agg << player_stats[:shoe]
    end 
  end
  biggest = agg.max
  game_hash.each do |loc, team|
     team[:players].each do |player_stats|
        if player_stats[:shoe] == biggest
          return player_stats[:rebounds]
        end 
     end 
  end 
end 

def most_points_scored
  agg = []
  game_hash.each do |loc, team|
    team[:players].each do |player_stats|
       agg << player_stats[:points]
    end 
  end
  biggest = agg.max
  game_hash.each do |loc, team|
     team[:players].each do |player_stats|
        if player_stats[:points] == biggest
          return player_stats[:player_name]
        end 
     end 
  end 
end 

def winning_team
  home_score = 0
  away_score = 0
  home_agg = []
  away_agg = []
  game_hash[:home][:players].each do |player|
    home_agg << player[:points]
  end 
  home_score = home_agg.reduce {|sum, n| sum + n}
  
   game_hash[:away][:players].each do |player|
    away_agg << player[:points]
  end 
  away_score = away_agg.reduce {|sum, n| sum + n}
  
    if home_score > away_score
      return game_hash[:home][:team_name]
    else if home_score < away_score
      return game_hash[:away][:team_name]
    else 
     return "Tie Game"
    end 
  end 
end 

def player_with_longest_name
  player_names = []
  game_hash.each do |loc, team|
    team[:players].each do |player_stats|
      player_names << player_stats[:player_name]
    end 
  end 
  longest = player_names.inject do |memo, word|
    memo.length > word.length ? memo : word 
  end 
  return longest 
end 

def long_name_steals_a_ton?
  player_names = []   #longest name 
  game_hash.each do |loc, team|
    team[:players].each do |player_stats|
      player_names << player_stats[:player_name]
    end 
  end 
  longest = player_names.inject do |memo, word|
    memo.length > word.length ? memo : word 
  end    # close longest name 
  
  player_steals = []   #most steals
  game_hash.each do |loc, team|
    team[:players].each do |player_stats|
      player_steals << player_stats[:steals]
    end 
  end 
  most = player_steals.max  #close most steals 
  
   game_hash.each do |loc, team|
    team[:players].each do |player_stats|
      if player_stats[:player_name] == longest
        return player_stats[:steals].eql? most 
      end 
    end 
   end 
  
end 

